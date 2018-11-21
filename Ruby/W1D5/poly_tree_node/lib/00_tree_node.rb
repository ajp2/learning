class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def parent=(parent_node)
    parent.children.delete(self) unless parent == nil
    @parent = parent_node
    parent_node.children << self unless parent_node == nil
  end

  def children
    # use to dup to avoid someone modifying children directly 
    # throgh the children arrray
    @children.dup
  end

  def value
    @value
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Not a child of the node" if !@children.include?(child_node)
    child_node.parent = nil
    @children.delete(child_node)
  end

  def dfs(target_value)
    return self if value == target_value

    children.each do |child|
      found = child.dfs(target_value)
      return found if found
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      node = queue.shift
      return node if node.value == target_value
      queue += node.children
    end
  end
end