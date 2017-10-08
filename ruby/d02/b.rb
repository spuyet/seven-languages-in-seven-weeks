class Tree

  attr_reader :name

  def initialize(name, children)
    @name = name
    @children = build_children(children)
  end

  def visit(&block)
    block.call self
  end

  def visit_all(&block)
    visit(&block)
    @children.each { |child| child.visit_all(&block) }
  end

  private

  def build_children(children)
    children.each_with_object([]) do |(k, v), tree|
      tree << Tree.new(k, v)
    end
  end

end


t = Tree.new('Mojo',
  { node_1: { leaf_1: {}, leaf_2: {} }, node_2: { leaf_3: {}, leaf_4: {} } })

t.visit_all { |node| puts node.name }
