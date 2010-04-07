require File.join(File.dirname(__FILE__), '..', '..', 'helper')
require 'rr'

class MyTest < Test::Unit::TestCase
  include RR::Adapters::RRMethods

  def test_stubbing_instance_methods_on_real_objects
    item1, item2 = Object.new, Object.new
    stub(item1).pence { 1000 }
    stub(item2).pence { 2000 }

    product = Product.new
    stub(product).prices { [ item1, item2 ] }
    assert_equal [1000, 2000], product.prices.map { |p| p.pence }
  end
end
