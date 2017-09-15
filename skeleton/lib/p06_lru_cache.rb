require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    node = @map.get(key)
    if @store.include?(key)
      update_node!(node)
    else
      new_val = prc.call(key)


      @store.calc!(node.key)


  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    @store.append(key, @map.get(key))
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
    node.remove
    @store.append(node.key, node.val)
    # suggested helper method; move a node to the end of the list
  end

  def eject!
    @store.first.remove
  end
end
