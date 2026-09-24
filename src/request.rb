module Foobara
  module CommandConnectors
    class Foob < ShCliConnector
      class Request < ShCliConnector::Request
        def action_parser
          @action_parser ||= ActionParser.new
        end

        def globalish_parser
          @globalish_parser ||= ShCliConnector::GlobalishParser.new
        end
      end
    end
  end
end
