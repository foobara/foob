# TODO: we should just opt into these and they should be discoverable by Foob
# or registered upon it as-needed.
require "foobara/empty_ruby_project_generator"
require "foobara/empty_typescript_react_project_generator"
require "foobara/command_generator"
require "foobara/domain_generator"
require "foobara/domain_mapper_generator"
require "foobara/foobify_rails_app"
require "foobara/organization_generator"
require "foobara/type_generator"
require "foobara/sh_cli_connector_generator"
require "foobara/mcp_connector_generator"
require "foobara/rack_connector_generator"
require "foobara/local_files_crud_driver_generator"
require "foobara/redis_crud_driver_generator"
require "foobara/remote_imports_generator"
require "foobara/resque_connector_generator"
require "foobara/resque_scheduler_connector_generator"
require "foobara/typescript_remote_command_generator"
require "foobara/typescript_react_command_form_generator"

module Foobara
  module CommandConnectors
    class Foob < ShCliConnector
      def generator_key_to_command_class(key)
        all_known_generator_classes.find do |generator_class|
          generator_key_or_keys = generator_class.generator_key

          if generator_key_or_keys.is_a?(::Array)
            generator_key_or_keys.index(key).tap do |index|
              if index && index > 0
                warn "DEPRECATED: #{key} is deprecated. Use #{generator_key_or_keys.first} instead."
              end
            end
          else
            key == generator_key_or_keys
          end
        end
      end

      def request_to_command_class(request)
        action = request.action

        case action
        when "version"
          Commands::Version
        when "generate"
          generator_key = request.argument

          if generator_key.nil?
            generator_keys = all_known_generator_keys.map { |s| "  #{s}" }
            generator_keys = generator_keys.join("\n")

            request.error = ParseError.new(
              message: "Usage: #{program_name} generate [GENERATOR_KEY] [GENERATOR_OPTIONS]\n\n" \
                       "Available Generators:\n\n#{generator_keys}"
            )
            return
          end

          generate_command_class = generator_key_to_command_class(generator_key)

          if generate_command_class.nil?
            request.error = ParseError.new(
              message: "Generator not found: #{generator_key}\n\n" \
                       "Available Generators: #{all_known_generator_keys.join(", ")}"
            )
            return
          end

          transform_command_class(generate_command_class)
        when "console"
          # Not going to bother creating a command for this one
          # simplecov:disable
          run_console = -> { exec({ "IRB_PROMPT_PREFIX" => "foob" }, "./bin/console") }

          if Bundler.respond_to?(:with_unbundled_env)
            Bundler.with_unbundled_env(&run_console)
          else
            run_console.call
          end
          # simplecov:enable
        else
          super
        end
      end

      def request_to_command_inputs(request)
        if ["generate", "version"].include?(request.action)
          request.inputs
        else
          super
        end
      end

      private

      def all_known_generator_classes
        @all_known_generator_classes ||= Util.descendants(Generators::WriteGeneratedFilesToDisk)
      end

      def all_known_generator_keys
        @all_known_generator_keys ||= all_known_generator_classes.map do |klass|
          generator_key_or_keys = klass.generator_key

          generator_key_or_keys.is_a?(::Array) ? generator_key_or_keys.first : generator_key_or_keys
        end.sort
      end
    end
  end
end
