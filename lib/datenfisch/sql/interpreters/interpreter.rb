require 'datenfisch/utils/visitor'

module Datenfisch
  module Sql
    class Interpreter
      include Utils::Visitor
      extend Forwardable
      def_delegators :@builder, :query, :selection, :predicates,
                                :query=, :source, :as_arel

      def initialize builder
        @builder = builder
      end
    end
  end
end
