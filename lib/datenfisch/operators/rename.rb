require 'datenfisch/utils/record'
require 'datenfisch/operators/methods'

module Datenfisch
  module Operators
    class Rename < Utils.record(:old_name, :new_name)
      include Methods
      def apply_to_type input_type
        Set.new(input_type).delete(@old_name).add(@new_name)
      end
    end
  end
end
