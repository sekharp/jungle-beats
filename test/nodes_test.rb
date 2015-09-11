gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/nodes'

class NodesTest < Minitest::Test

  def test_node_created
    node = Node.new("turing")
    assert_equal "turing", node.data
  end

  def test_node_nextnode_defaults_to_nil
    node = Node.new("turing")
    assert_equal nil, node.nextnode
  end

  def test_node_created_with_both_parameters
    node = Node.new("turing")
    node_2 = Node.new("gschool", node)
    assert_equal "turing", node_2.nextnode.data
  end

end
