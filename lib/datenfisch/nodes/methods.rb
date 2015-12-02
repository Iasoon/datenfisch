module Datenfisch
  module Nodes
    module Methods
      def eq other
        Equality.new(self, other)
      end

      def + other
        Addition.new(self, other)
      end
    end
  end
end
