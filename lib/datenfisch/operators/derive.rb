require 'datenfisch/utils/record'
require 'datenfisch/operators/methods'

module Datenfisch
  module Operators
    class Derive < Utils.record(:name, :node)
      include Methods
      def apply_to_type input_type
        input_type < @name
      end
    end
  end
end
