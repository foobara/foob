module Foobara
  module CommandConnectors
    class Foob < ShCliConnector
      class ActionParser < ShCliConnector::ActionParser
        def supported_actions
          # TODO: implement a shortcut feature for this stuff
          %w[generate]
        end

        def normalize_action(action)
          if action == "g"
            "generate"
          else
            super
          end
        end
      end
    end
  end
end
