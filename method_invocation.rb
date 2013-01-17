class MyClass
  def do_something
    "Public method called"
  end

  private
  
  def do_something_private
    "Private method called"
  end
end

class MyClassTest < Test::Unit::TestCase
  def test_getting_public_method

    method = MyClass.new.public_method(:do_something)
    assert_equal Method, method.class
    assert_equal "Public method called", method.call
  end
  
  def test_getting_private_method_raises_error
    assert_raise(NameError) do
      MyClass.new.public_method(:do_something_private)
    end
  end

  def test_getting_unbound_method

    method = MyClass.instance_method(:do_something)
    assert_equal UnboundMethod, method.class

    bound_method = method.bind(MyClass.new)
    assert_equal "Public method called", bound_method.call    
  end
end