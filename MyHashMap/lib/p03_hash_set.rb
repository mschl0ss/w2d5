class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    @store[key.hash % @store.length] << key
    @count += 1
    resize! if @count >= @store.length
  end

  def include?(key)
    @store[key.hash % @store.length].each do |ele|
      return true if ele == key
    end
    false
  end

  def remove(key)
    if include?(key)
      @store[key.hash % @store.length].delete(key)
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    h = HashSet.new(@store.length * 2)
    @store.each do |bucket|
      bucket.each do |key|
        h.insert(key)
      end
    end
    @store = h.store
    @count = 0
  end
end
