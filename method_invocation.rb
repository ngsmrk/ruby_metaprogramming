class MyClass
  def do_something
    puts "Public method called"
  end
  
  private
  
  def do_something_private
    "Private method called"
  end  
end

class MyClassTest < Test::Unit::TestCase
  def test_getting_public_method

    method = MyClass.new.method(:do_something)
    assert_equal Method, method.class
  end
  
  def test_getting_private_method_raises_error
    assert_raise(NameError) do
      MyClass.new.public_method(:do_something_private)      
    end
  end  
end

