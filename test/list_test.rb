gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/list'

class ListTest < Minitest::Test

  # turn pseudocode into tests then drill down to unit tests
  # test for when there are two of the same data

  def test_it_creates_empty_list
    list = List.new
    assert_equal nil, list.head
  end

  def test_it_creates_empty_list_nextnode
    list = List.new
    assert_equal nil, list.nextnode
  end

  def test_it_creates_list_with_one_node_data
    node = Node.new("green")
    list = List.new(node)
    assert_equal "green", list.head.data
  end

  def test_it_creates_list_with_one_node_nextnode
    node = Node.new("green")
    list = List.new(node)
    assert_equal nil, list.head.nextnode
  end

  def test_it_creates_list_with_two_nodes
    node = Node.new("green")
    node_2 = Node.new("red", node)
    list = List.new(node_2)
    assert_equal "green", list.head.nextnode.data
  end

  def test_append_string_of_three_items
    string = "beep boop bizzle"
    list = List.new
    list.append(string)
    assert_equal "", list.head.nextnode.data
  end


  def test_it_appends_to_empty_list
    list = List.new
    list.append("violet")
    assert_equal "violet", list.head.data
  end

  def test_awesome_appending_method_one_parameter
    node = Node.new("green")
    list = List.new(node)
    list.append("yellow")
    assert_equal "yellow", list.head.nextnode.data
  end

  # test nontrivial number of nodes - 2-3
  # test each method for expected and edge cases

end
