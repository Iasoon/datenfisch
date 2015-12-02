require 'datenfisch/sql/interpreters/arel_translator'
require 'datenfisch/sql/interpreters/operator_interpreter'

module Datenfisch
  module Sql
    class QueryBuilder
      extend Forwardable
      def_delegators :query, :selection, :predicates, :source, :source=
      attr_accessor :query

      def initialize query
        @query = query
        @arel_translator = ArelTranslator.new(self)
        @operation_interpreter = OperatorInterpreter.new(self)
      end

      def as_arel obj
        @arel_translator.visit obj
      end

      def apply operator
        @operation_interpreter.visit operator
        self # allow chaining
      end
    end
  end
end
