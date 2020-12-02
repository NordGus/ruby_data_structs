class CustomArray
  attr_reader :items, :count

  def initialize(size = 0)
    raise TypeError, "size must be Integer, got #{size.class}" unless size.class == Integer
    raise ArgumentError, "size must be greater than or equal to 0" if size < 0

    @items = Array.new(size)
    @count = 0
  end

  def print
    @items.each_index do |idx|
      break unless idx < @count
      puts @items[idx]
    end

    nil
  end

  def insert(item)
    raise ArgumentError, "item must be Integer, got #{item.class}" unless item.class == Integer

    if @items.count == @count
      new_items = Array.new(@count * 2)
      @items.each_index do |idx|
        break unless idx < @count
        new_items[idx] = @items[idx]
      end
      @items = new_items
    end

    @items[@count] = item
    @count += 1

    nil
  end

  def index_of(value)
    raise ArgumentError, "value must be Integer, got #{value.class}" unless value.class == Integer

    @items.each_index do |idx|
      break unless idx < @count
      return idx if @items[idx] == value
    end

    -1
  end

  def remove_at(index)
    raise ArgumentError, "index must be Integer, got #{index.class}" unless index.class == Integer
    raise ArgumentError, "index must be 0 >= index >= #{@count}, got #{index}" if index < 0 || index >= @count

    @items.each_index do |idx|
      next if idx < index
      break unless idx < @count
      @items[idx] = @items[idx + 1]
    end
    @count -= 1
    nil
  end

  def max
    out = nil
    @items.each_index do |idx|
      break unless idx < @count
      out = @items[idx] if out.nil? || @items[idx] > out
    end
    out
  end

  def intersect(array)
    raise ArgumentError, "array must be CustomArray, got #{array.class}" unless array.class == CustomArray
    out = Array.new
    @items.each_index do |idx|
      break unless idx < @count
      out << @items[idx] if array.index_of(@items[idx]) != -1
    end
    out
  end

  def insert_at(item, index)
    raise ArgumentError, "item must be Integer, got #{item.class}" unless item.class == Integer
    raise ArgumentError, "index must be Integer, got #{index.class}" unless index.class == Integer
    raise ArgumentError, "index must be 0 >= index >= #{@count}, got #{index}" if index < 0 || index >= @count

    @items[index] = item
    nil
  end

  def reverse
    reversed = Array.new(@items.count)
    j = @count
    
    @items.each_index do |idx|
      break unless idx < @count
      j -= 1
      reversed[i] = @items[j]
    end
    @items = reversed

    nil
  end
end