require 'datenfisch/nodes/combinator'

module Datenfisch
  module Nodes
    Equality = lift_arel Arel::Nodes::Equality
    Conjuction = lift_arel Arel::Nodes::And
    Disjunction = lift_arel Arel::Nodes::Or
  end
end
