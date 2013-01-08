class MyClass
  def public_method
    "Public method called"
  end
  
  private
  
  def private_method
    "Private method called"
  end  
end

class MyClassTest < Test::Unit::TestCase
  def test_getting_public_method
    method = MyClass.public_method(:public_method)
    assert_equal Method, method.class
  end
  
  def test_getting_private_method_raises_error
    assert_raise(NameError) do
      MyClass.public_method(:private_method)      
    end
  end  
end

