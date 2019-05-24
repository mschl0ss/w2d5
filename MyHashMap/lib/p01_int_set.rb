require 'byebug'
class MaxIntSet

  attr_reader :store
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" unless num.between?(0, @max)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % num_buckets] << num
  end

  def remove(num)
    bucket = @store[num % num_buckets]
    bucket.delete(num)
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
 
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end
  
  def insert(num)
    # debugger
    bucket = @store[num % num_buckets]
    # if count == @store.size

    unless bucket.include?(num)
      bucket << num
      @count += 1
    end
    resize! if @count == num_buckets
  end

  def remove(num)
    bucket = @store[num % num_buckets]
    if bucket.include?(num)
      bucket.delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    
    holding_store = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    for bucket in holding_store
      for num in bucket
        insert(num)
      end
    end

  end


end
