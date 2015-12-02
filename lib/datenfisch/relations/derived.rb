require 'datenfisch/utils/record'
require 'datenfisch/relations/methods'
require 'datenfisch/sql/query_builder'

module Datenfisch
  module Relations
    class Derived < Utils.record(:source, :function)
      include Methods
      def apply fun
        Derived.new(self.source, self.function.compose(fun))
      end

      def attributes
        @attributes ||= @function.apply_to_type(@source.attributes)
      end

      def query
        Sql::QueryBuilder.new(@source.query).apply(@function).query
      end
    end
  end
end
