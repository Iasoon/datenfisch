require 'datenfisch/utils/record'
require 'datenfisch/nodes/methods'

module Datenfisch
  module Nodes
    def self.combinator &proc
      klass = Class.new Combinator
      klass.define_singleton_method :combine, &proc
      klass
    end

    def self.lift_arel arel_node
      combinator { |*args| arel_node.new(*args) }
    end

    class Combinator < Utils.record(:children)
      include Methods
      def initialize *children
        @children = children
      end
    end
  end
end
