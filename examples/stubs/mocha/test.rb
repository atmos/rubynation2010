require File.join(File.dirname(__FILE__), '..', '..', 'helper')
require 'mocha'

class MyTest < Test::Unit::TestCase
  def test_stubbing_instance_methods_on_real_objects
    prices = [stub(:pence => 1000), stub(:pence => 2000)]
    product = Product.new
    product.stubs(:prices).returns(prices)
    assert_equal [1000, 2000], product.prices.map {|p| p.pence }
  end

  def test_stubbing_an_instance_method_on_all_instances_of_a_class
    Product.any_instance.stubs(:name).returns('stubbed_name')
    product = Product.new
    assert_equal 'stubbed_name', product.name
  end
end
