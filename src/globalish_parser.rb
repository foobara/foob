module Foobara
  module CommandConnectors
    class Foob < ShCliConnector
      class GlobalishParser < ShCliConnector::GlobalishParser
        def setup_parser
          super

          # TODO: just move this to ShCliConnector::GlobalishParser?
          parser.on("-v", "--version", "Show version information") do
            result.parsed[:action] = "version"
          end
        end
      end
    end
  end
end
