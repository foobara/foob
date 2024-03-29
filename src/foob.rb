require "foobara/empty_ruby_project_generator"
require "foobara/empty_typescript_react_project_generator"
require "foobara/command_generator"
require "foobara/domain_generator"
require "foobara/organization_generator"
require "foobara/type_generator"
require "foobara/sh_cli_connector_generator"
require "foobara/rack_connector_generator"
require "foobara/redis_crud_driver_generator"
require "foobara/resque_connector_generator"
require "foobara/resque_scheduler_connector_generator"
require "foobara/typescript_remote_command_generator"
require "foobara/typescript_react_command_form_generator"
require "foobara/autocrud_generator"

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

      def request_to_command(request)
        action = request.action
        inputs = nil
        transformed_command_class = nil

        case action
        when "generate"
          generator_key = request.argument

          if generator_key.nil?
            request.error = ParseError.new(
              "Usage: #{program_name} generate [GENERATOR_KEY] [GENERATOR_OPTIONS]\n\n" \
              "Available Generators: #{generator_keys_to_command_class.keys.sort.join(", ")}"
            )
            return
          end

          generate_command_class = generator_key_to_command_class(generator_key)

          if generate_command_class.nil?
            request.error = ParseError.new(
              "Generator not found: #{generator_key}\n\n" \
              "Available Generators: #{generator_keys_to_command_class.keys.sort.join(", ")}"
            )
            return
          end

          transformed_command_class = transform_command_class(generate_command_class)
          request.command_class = transformed_command_class

          inputs = request.inputs
        else
          return super
        end

        if inputs && !inputs.empty?
          transformed_command_class.new(inputs)
        else
          transformed_command_class.new
        end
      end
    end
  end
end
