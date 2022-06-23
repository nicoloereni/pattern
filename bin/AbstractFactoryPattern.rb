class Error
  def self.raise_not_implemented_error(klass, method)
    raise NotImplementedError, "#{klass} has not implemented method '#{method}'"
  end
end

class AbstractFactory
  def create_product_a
    Error.raise_not_implemented_error(self.class, __method__)
  end

  def create_product_b
    Error.raise_not_implemented_error(self.class, __method__)
  end
end

class ConcreteFactory1 < AbstractFactory
  def create_product_a
    ConcreteProductA1.new
  end

  def create_product_b
    ConcreteProductB1.new
  end
end

class ConcreteFactory2 < AbstractFactory
  def create_product_a
    ConcreteProductA2.new
  end

  def create_product_b
    ConcreteProductB2.new
  end
end

class AbstractProductA
  def useful_function_a
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ConcreteProductA1 < AbstractProductA
  def useful_function_a
    'The result of the product A1.'
  end
end

class ConcreteProductA2 < AbstractProductA
  def useful_function_a
    'The result of the product A2.'
  end
end

class AbstractProductB
  def useful_function_b
    Error.raise_not_implemented_error(self.class, __method__)
  end

  def another_useful_function_b(_collaborator)
    Error.raise_not_implemented_error(self.class, __method__)
  end
end

class ConcreteProductB1 < AbstractProductB
  def useful_function_b
    'The result of the product B1.'
  end

  def another_useful_function_b(collaborator)
    result = collaborator.useful_function_a
    "The result of the B1 collaborating with the (#{result})"
  end
end

class ConcreteProductB2 < AbstractProductB
  def useful_function_b
    'The result of the product B2.'
  end

  def another_useful_function_b(collaborator)
    result = collaborator.useful_function_a
    "The result of the B2 collaborating with the (#{result})"
  end
end