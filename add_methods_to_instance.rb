class MyClass
end

class AddMethodsToInstanceTest < Test::Unit::TestCase

	def test_define_instance_method

		my_class = MyClass.new
		def my_class.added_method
			"HELLO"
		end

		assert_equal "HELLO", my_class.added_method
	end

	def test_define_class_method

		def MyClass.added_method
			"HELLO"
		end

		assert_equal "HELLO", MyClass.added_method
	end

	def test_define_method_using_send
		color_name = 'black'

		MyClass.send(:define_method, 'color') do
		  color_name
		end

		assert_equal color_name, MyClass.new.color
	end
end