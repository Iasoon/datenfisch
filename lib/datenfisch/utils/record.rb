module Datenfisch
  module Utils
    def self.record *attrs
      attrs = attrs.map(&:to_s)
      klass = Class.new do |k|
        attr_reader *attrs

        define_singleton_method :attributes, ->{ attrs }

        def initialize *args
          self.class.attributes.zip(args).each do |attr, value|
            instance_variable_set("@#{attr}", value)
          end
        end

        def eql? other
          self.class.attributes.all? do |attr|
            self.send(attr) == other.send(attr)
          end
        end

        def hash
          self.class.attributes.map {|a| send(a).hash}.reduce(&:^)
        end

        alias_method :==, :eql?
      end
    end
  end
end
