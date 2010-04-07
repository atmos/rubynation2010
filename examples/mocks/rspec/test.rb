require File.join(File.dirname(__FILE__), '..', '..', 'helper')
require 'spec'

describe "mocking methods" do
  it "mock class methods" do
    product = Product.new
    Product.should_receive(:find).with(1).and_return(product)
    Product.find(1).should eql(product)
  end

  it "mock a method on an instance" do
    product = Product.new
    product.should_receive(:save).and_return(true)
    product.save.should be_true
  end

  it "mocks traditionally" do
    item = mock('Item')
    item.should_receive(:expected_method).
                        with(:p1, :p2).and_return(:result)
    item.expected_method(:p1, :p2).should eql(:result)
  end
end
