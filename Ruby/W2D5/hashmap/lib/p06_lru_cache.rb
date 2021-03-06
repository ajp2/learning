require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
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
    if @map.include?(key)
      update_node!(@map[key])
      return @map[key].val
    else
      calc!(key)
      eject! if @map.count > @max
      return @map[key].val
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    val = @prc.call(key)
    @store.append(key, val)
    @map[key] = @store.last
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    key = node.key
    val = node.val
    node.remove
    @store.append(key, val)
    @map[key] = @store.last
  end

  def eject!
    @map.delete(@store.first.key)
    @store.first.remove
  end
end
