class Node

  attr_accessor :data, :nextnode

  def initialize (data, nextnode = nil)
    @data = data
    @nextnode = nextnode
  end

end
