class MyClass
	attr_reader :name
end

class InstanceVariableManipulationTest < Test::Unit::TestCase
	def test_set_instance_variable
		my_class = MyClass.new
		my_class.instance_variable_set("@name", "Angus")
		assert_equal "Angus", my_class.instance_variable_get("@name")
	end
end