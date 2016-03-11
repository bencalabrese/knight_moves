class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  attr_reader :value, :parent, :children

  def parent=(new_parent_node)
    parent.children.delete(self) unless parent.nil?

    @parent = new_parent_node

    parent.children << self unless parent.nil?
  end

  def inspect
    @value.inspect
  end

  def add_child(child_node)
    child_node.parent = self
    @children << child_node unless @children.include?(child_node)
  end

  def remove_child(child)
    raise "Not one of your children :(" unless @children.include?(child)
    @children.delete(child)
    child.parent = nil
  end

end
