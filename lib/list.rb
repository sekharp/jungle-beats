require_relative 'nodes'
#Hello

class List
  attr_accessor :head, :nextnode

  def initialize(head = nil)
    @head = head
  end

  def beep_parse(beep_string)
    array = beep_string.split(" ")
    array.each do |element|
      Node.new(element)
      # might be fine with just array of strings, shift or pop off it
      # then use each string as arguments for these methods in list class
    end
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
    # still need to solve position way way outside list
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

  def pop
    # pop more than one element from end needs to work - put in a times counter?
    here = @head
    until here.nextnode.nextnode.nil?
      here = here.nextnode
    end
    element = here.nextnode
    here.nextnode = nil
    return element
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
    array = [@head.data]
    here = @head
    until here.nextnode.nil?
      here = here.nextnode
      array << here.data
    end
    array.join(" ")
  end

  def find(position, number_of_elements)
    # THIS IS A HOT MESS

    # array = []
    # here = @head
    # counter = 0
    # until counter == position - 1
    #   here = here.nextnode
    #   counter += 1
    # end
    #
    # here
    #
    # times = 0
    # until times == number_of_elements
    #   here = here.nextnode.nextnode
    #   array << here.data
    #   times += 1
    # end
    # array.join(" ")
  end
  # find - return one or more values based on arbitrary positions in the list. one or more elements based on arbitrary positions in the list.
      # the first parameter indicates the first position to return and the second parameter specifies how many elements to return.

end

newlist = List.new

yellow = Node.new("yellow")
list = List.new(yellow)
list.append("red")
list
list.insert(0, "green")
list
list.includes?("red")
list.all
list.insert(0, "blue")
