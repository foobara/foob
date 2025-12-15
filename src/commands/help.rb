module Foobara
  module CommandConnectors
    class Foob < ShCliConnector
      module Commands
        class Help < ShCliConnector::Commands::Help
          def command_class
            return @command_class if defined?(@command_class)

            @command_class = if argument
                               generate_command_class = command_connector.generator_key_to_command_class(argument)

                               if generate_command_class
                                 # Using send hack here to transform the class without having to register it
                                 command_connector.send(:transform_command_class, generate_command_class)
                               else
                                 super
                               end
                             end
          end

          def known_actions
            [*super, "generate", "version", "console"]
          end
        end
      end
    end
  end
end
