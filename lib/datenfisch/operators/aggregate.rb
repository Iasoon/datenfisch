module Datenfisch
  module Operators
    class Aggregate < Utils.record(:grouping, :aggregates)
      include Methods

      def apply_to_type input_type
        #TODO: make sure the required types are present
        self.aggregates.map(&:type).unshift(self.grouping).compact.to_set
      end
    end
  end
end
