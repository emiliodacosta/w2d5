class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    self.prev.next = self.next
    self.next.prev = self.prev
  end
end

class LinkedList

include Enumerable

  def initialize(head = Node.new, tail = Node.new)
    @head = head
    @tail = tail
    @head.next = tail
    @tail.prev = head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def append(key, val)
    new_node = Node.new(key, val)
    new_node.prev = @tail.prev
    new_node.next = @tail
    @tail.prev.next = new_node
    @tail.prev = new_node
  end

  def update(key, val)
    node = self.first
    node.val = val if node.key == key
    until node.key == key
      return if node == @tail
      node = node.next
      node.val = val if node.key == key
    end
  end

  def get(key)
    node = self.first
    until node.key == key
      return if node == @tail
      node = node.next
    end
    node.val
  end

  def include?(key)
    node = self.first
    until node.key == key
      return false if node == @tail
      node = node.next
    end
    true
  end

  def remove(key)
    node = self.first
    node.remove if node.key == key
    until node.key == key
      return if node == @tail
      node = node.next
      node.remove if node.key == key
    end
  end

  def each
    node = self.first
    until node == @tail
      yield(node)
      node = node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
