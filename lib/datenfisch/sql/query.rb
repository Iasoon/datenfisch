require 'datenfisch/sql/query_builder'

module Datenfisch
  module Sql
    class Query
      attr_accessor :selection, :predicates, :grouping, :source, :is_aggregated
      alias_method :aggregated?, :is_aggregated

      def initialize source_arel, selection
        @source = source_arel
        @predicates = []
        @selection = selection
        @is_aggregated = false
      end

      def arel
        m = Arel::SelectManager.new(ActiveRecord::Base)
        m.from(@source)
        m.project(selection_arel)
        m.where(predicates_arel) unless @predicates.empty?
        m.group(@grouping) if @grouping
      end

      private

      def selection_arel
        @selection.map do |name, node|
          Arel::Nodes::As.new(node, Arel.sql(name))
        end
      end

      def predicates_arel
        @predicates.reduce(&:and)
      end
    end
  end
end
