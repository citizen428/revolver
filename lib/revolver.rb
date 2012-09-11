class Revolver
  def self.from_array(array, unique = false)
    rev = Revolver.new(array.size, unique)
    array.inject(rev) { |r, e| r << e }
  end

  def self.[](*array)
    from_array(array)
  end

  def initialize(size, unique = false)
    @array = []
    @size = size
    @unique = unique
  end

  def push(e)
    @array.delete(e) if @unique
    @array << e
    @array.shift if @array.size > @size
    self
  end

  def pop
    @array.pop
  end

  def [](i)
    @array[i % @size]
  end

  def size
    @array.size
  end

  def to_a
    @array.dup
  end

  def to_s
    "#<Revolver: #{@array.inspect}>"
  end

  alias :<< :push
  alias :to_ary :to_a
end
