module Datenfisch
  module Operators
    module Methods
      def compose other
        Composite.new(self, other)
      end

      def apply target
        target.apply(self)
      end
    end
  end
end
