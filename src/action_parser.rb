module Foobara
  module CommandConnectors
    class Foob < ShCliConnector
      class ActionParser < ShCliConnector::ActionParser
        def supported_actions
          # TODO: implement a shortcut feature for this stuff
          [*super, "generate", "console", "version"]
        end

        def normalize_action(action)
          return action if supported_actions.include?(action)

          matches = supported_actions.select { |a| a.start_with?(action) }

          if matches.size == 1
            matches.first
          else
            super
          end
        end
      end
    end
  end
end
