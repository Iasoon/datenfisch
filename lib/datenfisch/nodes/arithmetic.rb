require 'arel' # help why is this needed
require 'datenfisch/nodes/combinator'

module Datenfisch
  module Nodes
    Addition = lift_arel Arel::Nodes::Addition
    Subtraction = lift_arel Arel::Nodes::Subtraction
    Multiplication = lift_arel Arel::Nodes::Multiplication
    Division = lift_arel Arel::Nodes::Division
  end
end
