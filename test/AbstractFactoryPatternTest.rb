require "test/unit"
require_relative "../bin/AbstractFactoryPattern"

class AbstractFactoryPatternTest < Test::Unit::TestCase
  def test_abstract_class_raise_exception_if_methods_are_not_defined
    abstract_factory = AbstractFactory.new

    error_a = assert_raises(NotImplementedError) { abstract_factory.create_product_a }
    assert_equal("AbstractFactory has not implemented method 'create_product_a'", error_a.to_s)

    error_b = assert_raises(NotImplementedError) { abstract_factory.create_product_b }
    assert_equal("AbstractFactory has not implemented method 'create_product_b'", error_b.to_s)
  end

  def test_concrete_factory1_return_expected_products
    concrete_factory1 = ConcreteFactory1.new
    product_a = concrete_factory1.create_product_a

    assert_not_nil product_a
    assert_equal 'The result of the product A1.', product_a.useful_function_a

    product_b = concrete_factory1.create_product_b
    assert_not_nil product_b
    assert_equal 'The result of the product B1.', product_b.useful_function_b
    assert_equal 'The result of the B1 collaborating with the (The result of the product A1.)', product_b.another_useful_function_b(product_a)
  end

  def test_concrete_factory2_return_expected_products
    concrete_factory2 = ConcreteFactory2.new
    product_a = concrete_factory2.create_product_a

    assert_not_nil product_a
    assert_equal 'The result of the product A2.', product_a.useful_function_a

    product_b = concrete_factory2.create_product_b
    assert_not_nil product_b
    assert_equal 'The result of the product B2.', product_b.useful_function_b
    assert_equal 'The result of the B2 collaborating with the (The result of the product A2.)', product_b.another_useful_function_b(product_a)
  end
end