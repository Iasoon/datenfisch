require 'datenfisch/sql/interpreters/interpreter'
require 'datenfisch/operators'
require 'datenfisch/sql/actions/join'
require 'datenfisch/sql/actions/aggregate'
require 'datenfisch/sql/query'

module Datenfisch
  module Sql
    class OperatorInterpreter < Interpreter

      visiting Operators::Composite do |operator|
        visit operator.left
        visit operator.right
      end

      visiting Operators::Project do |project|
        selection.keep_if do |name, attr|
          project.attributes.include? name
        end
      end

      visiting Operators::Rename do |rename|
        selection[rename.new_name] = @selection.delete(rename.old_name)
      end

      visiting Operators::Derive do |derive|
        selection[derive.name] = as_arel(derive.node)
      end

      visiting Operators::Restrict do |restrict|
        predicates.push(as_arel(restrict.predicate))
      end

      visiting Operators::Join do |join|
        Actions::Join.new(self.query, join.relation.query).call
      end

      visiting Operators::Aggregate do |aggregate|
        Actions::Aggregate.new(@builder, aggregate).call
      end
    end
  end
end
