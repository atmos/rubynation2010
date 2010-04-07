require File.join(File.dirname(__FILE__), '..', '..', 'helper')
require 'rr'

class MyTest < Test::Unit::TestCase
  include RR::Adapters::RRMethods
  def test_mocking_a_class_method
    product = Product.new
    mock(Product).find.with(1).returns(product)
    assert_equal product, Product.find(1)
  end

  def test_mocking_an_instance_method_on_a_real_object
    product = Product.new
    mock(product).save.returns(true)
    assert product.save
  end
end
