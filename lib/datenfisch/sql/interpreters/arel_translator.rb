require 'datenfisch/sql/interpreters/interpreter'
require 'datenfisch/nodes'

module Datenfisch
  module Sql
    class ArelTranslator < Interpreter
      include Utils::Visitor

      visiting Nodes::Literal do |literal|
        Arel.sql(literal.object.to_s)
      end

      visiting Nodes::Attribute do |attribute|
        selection[attribute.name]
      end

      visiting Nodes::Combinator do |combinator|
        combinator.class.combine(*combinator.children.map {|n| visit n})
      end

      visiting Nodes::Aggregate do |aggregate|
        aggregate.class.apply(selection[aggregate.attribute])
      end

    end
  end
end
