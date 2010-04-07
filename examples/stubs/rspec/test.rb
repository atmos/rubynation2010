require File.join(File.dirname(__FILE__), '..', '..', 'helper')
require 'spec'

describe "stubbing methods" do
  it "stubs instance methods on real objects" do
    prices = [ mock('stub', :pence => 1000), mock('stub', :pence => 2000) ]
    product = Product.new
    product.stub!(:prices).and_return(prices)
    product.prices.map { |p| p.pence }.should eql([1000, 2000])
  end
end
