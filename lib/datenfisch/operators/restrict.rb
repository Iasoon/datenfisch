require 'datenfisch/utils/record'
require 'datenfisch/operators/methods'

module Datenfisch
  module Operators
    class Restrict < Utils.record(:predicate)
      include Methods

      def apply_to_type input_type
        input_type.to_set
      end
    end
  end
end
