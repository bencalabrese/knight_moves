class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  attr_reader :value, :parent, :children

  def parent=(parent_node_name)
    @parent = parent_node_name

    parent.children << self unless parent.nil?
  end
end
