require 'datenfisch/utils'
require 'datenfisch/nodes/combinator'

module Datenfisch
  module Nodes
    def self.aggregate name, arel_node
      klass = Class.new Aggregate
      klass.define_singleton_method(:postfix) { name }
      klass.define_singleton_method(:apply) { |n| arel_node.new([n]) }
      klass
    end

    class Aggregate < Utils.record(:attribute)
      def type
        [self.attribute, self.class.postfix].join('_')
      end
    end

    Sum = aggregate 'sum', Arel::Nodes::Sum
    Avg = aggregate 'avg', Arel::Nodes::Avg
    Count = aggregate 'count', Arel::Nodes::Count
  end
end
