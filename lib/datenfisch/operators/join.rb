require 'datenfisch/utils/record'
require 'datenfisch/operators/methods'

module Datenfisch
  module Operators
    class Join < Utils.record(:relation)
      include Methods

      def apply_to_type input_type
        input_type.to_set | relation.attributes
      end
    end
  end
end
