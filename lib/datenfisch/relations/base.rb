require 'datenfisch/utils/record'
require 'datenfisch/relations/methods'
require 'datenfisch/sql/query'

module Datenfisch
  module Relations
    class Base < Utils.record(:arel_table, :attributes)
      include Methods

      def initialize arel_table, attributes
        super(arel_table, attributes.to_set)
      end

      def query
        Sql::Query.new(@arel_table, attr_map)
      end

      private
      def attr_map
        Hash[@attributes.map {|attr| [attr, @arel_table[attr]]}]
      end
    end
  end
end
