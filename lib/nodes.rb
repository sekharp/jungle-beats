class Node
  attr_accessor :data, :nextnode  # => nil

  def initialize (data, nextnode = nil)
    @data = data                         # => "green"
    @nextnode = nextnode                 # => nil
  end                                    # => :initialize

end  # => :initialize

Node.new("green")  # => #<Node:0x007fb7ec097170 @data="green", @nextnode=nil>
