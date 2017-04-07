class Link
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
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @next.prev = @prev unless @next.nil?
    @prev.next = @next unless @prev.nil?
    @prev, @next = nil
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = nil
    @tail = nil
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    first.nil?
  end

  def get(key)
    each do |link|
      return link.val if link.key == key
    end
  end

  def include?(key)
    get(key) != nil
  end

  def append(key, val)
    link = Link.new(key, val)
    if @head.nil?
      link.prev = nil
      @head = link
      @tail = link
    else
      link.prev = @tail
      @tail.next = link
      @tail = link
    end
  end

  def update(key, val)
    each do |link|
      link.val = val if link.key = key
    end
  end

  def remove(key)
    link = nil
    each do |lk|
      link = lk if lk.key == key
    end

    unless link.nil?
      @head = link.next if link == @head
      @tail = link.prev if link == @tail
      link.remove
    end
  end

  def each
    link = @head
    until link.nil?
      yield(link) if block_given?
      link = link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
