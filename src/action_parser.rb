module Foobara
  module CommandConnectors
    class Foob < ShCliConnector
      class ActionParser < ShCliConnector::ActionParser
        def supported_actions
          # TODO: implement a shortcut feature for this stuff
          [*super, "generate", "console"]
        end

        def normalize_action(action)
          case action
          when "c"
            # :nocov:
            "console"
            # :nocov:
          when "g"
            "generate"
          else
            super
          end
        end
      end
    end
  end
end
