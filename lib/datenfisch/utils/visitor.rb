module Datenfisch
  module Utils
    module Visitor
      def self.included klass
        klass.extend ClassMethods
      end

      def visit obj
        obj.class.ancestors.each do |klass|
          method = "visit_#{klass.name}"
          return send(method, obj) if respond_to? method
        end
        raise "Cannot visit #{obj.class}"
      end

      module ClassMethods
        def visiting *klasses, &block
          klasses.each do |klass|
            define_method("visit_#{klass.name}", block)
          end
        end
      end
    end
  end
end
