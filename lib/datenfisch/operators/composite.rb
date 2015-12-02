require 'datenfisch/utils/record'
require 'datenfisch/operators/methods'

module Datenfisch
  module Operators
    class Composite < Utils.record(:left, :right)
      include Methods
      def apply_to_type input_type
        @right.apply_to_type(@left.apply_to_type(input_type))
      end
    end
  end
end
