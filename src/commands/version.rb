require_relative "../../version"

module Foobara
  module CommandConnectors
    class Foob < ShCliConnector
      module Commands
        class Version < Foobara::Command
          def execute
            set_version

            version
          end

          attr_accessor :version

          def set_version
            self.version = Foobara::Foob::VERSION
          end
        end
      end
    end
  end
end
