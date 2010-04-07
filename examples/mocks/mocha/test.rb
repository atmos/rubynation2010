require File.join(File.dirname(__FILE__), '..', '..', 'helper')
require 'mocha'

class MyTest < Test::Unit::TestCase
  def test_mocking_a_class_method
    product = Product.new
    Product.expects(:find).with(1).returns(product)
    assert_equal product, Product.find(1)
  end

  def test_mocking_an_instance_method_on_a_real_object
    product = Product.new
    product.expects(:save).returns(true)
    assert product.save
  end

  def test_traditional_mocking
    item = mock()
    item.expects(:expected_method).
           with(:p1, :p2).returns(:result)
    assert_equal :result, item.expected_method(:p1, :p2)
  end
end
