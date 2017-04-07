require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count < num_buckets
      self[key] << key
      @count += 1
    else
      resize!
      self.insert(key)
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    @count -= 1
    self[key].delete(key)
  end

  private

  def [](key)
    @store[key.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) { Array.new }

    @store.each do |bucket|
      bucket.each do |key|
        new_store[key.hash % (num_buckets * 2)] << key
      end
    end

    @store = new_store
  end
end
