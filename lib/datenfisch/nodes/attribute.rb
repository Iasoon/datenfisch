require 'datenfisch/utils/record'
require 'datenfisch/nodes/methods'

module Datenfisch
  module Nodes
    class Attribute < Utils.record(:name)
      include Methods
    end
  end
end
