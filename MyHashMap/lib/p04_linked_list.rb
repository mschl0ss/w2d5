require 'byebug'

class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

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
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList

  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new

    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    # @tail
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    debugger
    #(H) <=> (:first) <=> (T)
    #(H) <=> (:first) <=> (new_node) <=> (T)

    #create a new node
    new_node = Node.new(key,val)
    
    #:first's next node needs to be new node
    @tail.prev.next = new_node
    
    #tail's prev needs to be new_node's previous
    new_node.prev = @tail.prev
    
    #new_node's next node needs to be tail
    new_node.next = @tail

    #tail's prev node needs to be new_node
    @tail.prev = new_node

  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
