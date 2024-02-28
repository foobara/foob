require "foobara/empty_ruby_project_generator"

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
        generate_command_class = nil

        case action
        when "g", "generate"
          generator_key = request.argument

          generate_command_class = generator_key_to_command_class(generator_key)

          request.command_class = generate_command_class

          inputs = request.inputs
        else
          return super
        end

        if inputs && !inputs.empty?
          generate_command_class.new(inputs)
        else
          generate_command_class.new
        end
      end
    end
  end
end
