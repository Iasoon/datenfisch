require 'datenfisch/utils/record'
require 'datenfisch/nodes/methods'

module Datenfisch
  module Nodes
    class Literal < Utils.record(:object)
      include Methods
    end
  end
end
