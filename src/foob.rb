# TODO: we should just opt into these and they should be discoverable by Foob
# or registered upon it as-needed.
require "foobara/empty_ruby_project_generator"
require "foobara/empty_typescript_react_project_generator"
require "foobara/command_generator"
require "foobara/domain_generator"
require "foobara/domain_mapper_generator"
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
      def generator_key_to_command_class(generator_key)
        generator_keys_to_command_class[generator_key]
      end

      def generator_keys_to_command_class
        @generator_keys_to_command_class ||= begin
          h = {}
          Util.descendants(Generators::WriteGeneratedFilesToDisk).each do |c|
            if c.generator_key
              h[c.generator_key] = c
            end
          end

          h
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
            generator_keys = generator_keys_to_command_class.keys.sort.map { |s| "  #{s}" }
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
                       "Available Generators: #{generator_keys_to_command_class.keys.sort.join(", ")}"
            )
            return
          end

          transform_command_class(generate_command_class)
        when "console"
          # Not going to bother creating a command for this one
          # :nocov:
          run_console = -> { exec({ "IRB_PROMPT_PREFIX" => "foob" }, "./bin/console") }

          if Bundler.respond_to?(:with_unbundled_env)
            Bundler.with_unbundled_env(&run_console)
          else
            run_console.call
          end
          # :nocov:
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
    end
  end
end
