module Datenfisch
  module Relations
    module Methods
      def apply(fun)
        Derived.new(self, fun)
      end

      def inspect
        "#<Relation: #{attributes.to_a.join(' ')}>"
      end

      def to_sql
        query.arel.to_sql
      end
    end
  end
end
