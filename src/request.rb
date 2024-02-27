module Foobara
  module CommandConnectors
    class Foob < ShCliConnector
      class Request < ShCliConnector::Request
        def action_parser
          @action_parser ||= ActionParser.new
        end
      end
    end
  end
end
