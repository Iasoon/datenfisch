module Datenfisch
  module Sql
    module Actions
      class Aggregate
        extend Forwardable
        def_delegators :@builder, :as_arel, :query, :query=

        def initialize builder, aggregate
          @builder = builder
          @grouping = aggregate.grouping
          @aggregates = aggregate.aggregates
        end

        def call
          construct_subquery if query.aggregated?
          aggregate
        end

        private
        def aggregate
          query.grouping = query.selection[@grouping]
          query.selection = aggregate_selection
          query.is_aggregated = true
        end

        def aggregate_selection
          s = Hash[@aggregates.map {|a| [a.type, as_arel(a)] }]
          s[@grouping] = query.selection[@grouping] if @grouping
          s
        end

        def construct_subquery
          table = Arel::Nodes::TableAlias.new(
            query.arel, query.hash.abs.to_s(36))
          selection = Hash[query.selection.keys.map {|a| [a, table[a]]}]
          self.query = Query.new(table, selection)
        end
      end
    end
  end
end
