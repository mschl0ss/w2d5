class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    result = 0
    for i in (0...length-1)
      result += (length*2+(83*i))+self[i]
    end
    result
  end
end

class String
  def hash
    indices = 0
    alpha = ("a".."z").to_a
    self.each_char do |char| 
      if alpha.include?(char)
        indices += alpha.index(char)
      end
    end
    indices
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
