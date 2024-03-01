module Foobara
  module CommandConnectors
    class Foob < ShCliConnector
      module Commands
        class Help < ShCliConnector::Commands::Help
          def command_class
            binding.pry
            return @command_class if defined?(@command_class)

            @command_class = if argument
                               generate_command_class = generator_key_to_command_class(argument)

                               if generate_command_class
                                 transform_command_class(generate_command_class)
                               else
                                 super
                               end
                             end
          end

          def known_actions
            [*super, "generate"]
          end
        end
      end
    end
  end
end
