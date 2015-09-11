require_relative 'nodes'

class List

  attr_accessor :head, :nextnode, :data

  def initialize(head = nil)
    @head = head
  end

  def append(data)
    if @head == nil
      node = Node.new(data)
      @head = node
    else
      here = @head
      until here.nextnode.nil?
        here = here.nextnode
      end
      here.nextnode = Node.new(data)
    end
  end

  def prepend(data)
    new_node = Node.new(data, @head)
    @head = new_node
  end

  def insert(position, data)
    here = @head
    counter = 0

    if position == 0
      placeholder = @head
      @head = Node.new(data, placeholder)
      @head.nextnode = placeholder
      return @head
    end

    until counter == position - 1
      here = here.nextnode
      counter += 1
    end

    placeholder = here.nextnode
    here.nextnode = Node.new(data, placeholder)
  end

  def includes?(data)
    here = @head
    if here.data == data
      return true
    end

    while here.nextnode != nil
      here = here.nextnode
      if here.data == data
        return true
      end
    end

    if here.nextnode == nil
      if here.data == data
        return true
      end
      return false
    end
  end

  def remove_last_element
    here = @head
    until here.nextnode.nextnode.nil?
      here = here.nextnode
    end
    element = here.nextnode.data
    here.nextnode = nil
    return element
  end

  def pop(number)
    array = []
    number.times do |pop|
      array.unshift(self.remove_last_element)
    end
    string = array.join(" ")
    return string
  end

  def count
    here = @head
    counter = 1
    until here.nextnode.nil?
      here = here.nextnode
      counter += 1
    end
    counter
  end

  def all
    if @head == nil
      return ""
    end
    array = [@head.data]
    here = @head
    until here.nextnode.nil?
      here = here.nextnode
      array << here.data
    end
    array.join(" ")
  end

end
