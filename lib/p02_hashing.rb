class Fixnum

end

class Array
  def hash
    result = 0

    each_with_index do |el, idx|
      result = result ^ (el.hash + idx)
    end

    result
  end
end

class String
  def hash
    result = 0
    az = ('A'..'z').to_a + [' ']

    chars.each_with_index do |el, idx|
      result = result ^ (az.index(el) + idx)
    end

    result
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0

    each do |key, value|
      result = result ^ (key.hash + value.hash)
    end

    result
  end
end
