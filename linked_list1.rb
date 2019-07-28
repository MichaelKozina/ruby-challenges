class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_accessor :data

  def initialize
    @node = nil
  end

  def push(value)
    @data = LinkedListNode.new(value, @data)
  end

  def pop
    while @data != nil
      value = @data.value
      @data = @data.next_node
      return value
    end
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def reverse_list(list)
  stack1 = Stack.new

  while list
    stack1.push(list.value)
    list = list.next_node     # removes top node
  end

  stack2 = Stack.new
  value = stack1.pop
  while value
    stack2.push value
    value = stack1.pop
  end

  value = stack2.pop
  new_list = nil
  while value
    new_list = LinkedListNode.new(value, new_list)

    value = stack2.pop
  end

  return new_list
end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)
puts "-------"
revlist = reverse_list(node3)
print_values(revlist)