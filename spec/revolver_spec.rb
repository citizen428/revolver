require 'minitest/spec'
require 'minitest/autorun'
require 'revolver'

describe Revolver do
  before do
    @empty = Revolver.new(3)
    @full = Revolver.new(3).push(1).push(2).push(3)
  end

  it "creates a new Revolver from an array" do
    r = Revolver.from_array([*1..5])
    r.must_be_kind_of(Revolver)
    r.to_a.must_equal([1, 2, 3, 4, 5])
  end

  it "creates a new Revolver from an array" do
    r = Revolver[*1..5]
    r.must_be_kind_of(Revolver)
    r.to_a.must_equal([1, 2, 3, 4, 5])
  end

  it "returns an array representation of itself" do
    @empty.to_a.must_be_empty
    @full.to_a.must_equal([1, 2, 3])
  end

  it "tells you how many elements it contains" do
    @empty.size.must_equal(0)
  end

  it "does not grow over the specified size" do
    @full.push(4).size.must_equal(3)
  end

  it "chains calls to #push/#<<" do
    (@full << 4 << 5).to_a.must_equal([3, 4, 5])
  end

  it "pops an element off the end" do
    (@full).pop.must_equal(3)
    @full.to_a.must_equal([1, 2])
  end

  it "can be indexed like an array" do
    @full[1].must_equal(2)
    @full[-1].must_equal(3)
  end

  it "wraps around when indexing is out of bounds" do
    @full[5].must_equal(3)
    @full[-4].must_equal(3)
  end

  it "doesn't allow duplicates when created with the 'unique' option" do
    r = Revolver.new(3, true).push(1).push(1).push(2)
    r.push(1).to_a.must_equal([2, 1])
  end

end
