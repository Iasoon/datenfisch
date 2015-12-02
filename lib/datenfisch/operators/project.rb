require 'datenfisch/utils/record'
require 'datenfisch/operators/methods'

module Datenfisch
  module Operators
    class Project < Utils.record(:attributes)
      include Methods

      def apply_to_type input_type
        input_type.to_set & @attributes
      end

    end
  end
end
