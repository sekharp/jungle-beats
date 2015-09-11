gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/list'

class ListTest < Minitest::Test

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

  def test_it_creates_list_with_three_nodes
    node = Node.new("green")
    node_2 = Node.new("red", node)
    node_3 = Node.new("yellow", node_2)
    list = List.new(node_3)
    assert_equal "green", list.head.nextnode.nextnode.data
  end

  def test_it_appends_to_empty_list
    list = List.new
    list.append("violet")
    assert_equal "violet", list.head.data
  end

  def test_it_appends_one_node
    node = Node.new("green")
    list = List.new(node)
    list.append("yellow")
    assert_equal "yellow", list.head.nextnode.data
  end

  def test_it_pops_one_node
    node = Node.new("green")
    node_2 = Node.new("red", node)
    node_3 = Node.new("yellow", node_2)
    list = List.new(node_3)
    assert_equal "green", list.pop(1)
  end

  def test_it_pops_multiple_nodes
    node = Node.new("green")
    node_2 = Node.new("red", node)
    node_3 = Node.new("yellow", node_2)
    list = List.new(node_3)
    assert_equal "red green", list.pop(2)
  end

  def test_it_prepends
    node = Node.new("green")
    node_2 = Node.new("red", node)
    list = List.new(node_2)
    list.prepend("yellow")
    assert_equal "yellow", list.head.data
  end

  def test_it_counts
    node = Node.new("green")
    node_2 = Node.new("red", node)
    node_3 = Node.new("yellow", node_2)
    list = List.new(node_3)
    assert_equal 3, list.count
  end

  def test_it_does_all
    node = Node.new("green")
    node_2 = Node.new("red", node)
    node_3 = Node.new("yellow", node_2)
    list = List.new(node_3)
    assert_equal "yellow red green", list.all
  end

  def test_it_does_all_for_empty_list
    list = List.new
    assert_equal "", list.all
  end

  def test_includes_checks_for_value_there
    node = Node.new("green")
    node_2 = Node.new("red", node)
    node_3 = Node.new("yellow", node_2)
    list = List.new(node_3)
    assert_equal true, list.includes?("green")
  end

  def test_includes_checks_for_value_not_there
    node = Node.new("green")
    node_2 = Node.new("red", node)
    node_3 = Node.new("yellow", node_2)
    list = List.new(node_3)
    assert_equal false, list.includes?("blue")
  end

  def test_insert_works_for_first_spot
    node = Node.new("green")
    node_2 = Node.new("red", node)
    node_3 = Node.new("yellow", node_2)
    list = List.new(node_3)
    list.insert(0, "blue")
    assert_equal "blue", list.head.data
  end

  def test_insert_works_for_middle_spot
    node = Node.new("green")
    node_2 = Node.new("red", node)
    node_3 = Node.new("yellow", node_2)
    list = List.new(node_3)
    list.insert(1, "blue")
    assert_equal "blue", list.head.nextnode.data
  end

  def test_insert_works_for_last_spot
    node = Node.new("green")
    node_2 = Node.new("red", node)
    node_3 = Node.new("yellow", node_2)
    list = List.new(node_3)
    list.insert(3, "blue")
    assert_equal "blue", list.head.nextnode.nextnode.nextnode.data
  end

end
