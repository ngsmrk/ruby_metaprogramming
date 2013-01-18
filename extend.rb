module Mod
  def hello
    "Hello from Mod"
  end
end

class Klass
  def hello
    "Hello from Klass"
  end
end

class ExtendTest < Test::Unit::TestCase

	def test_extend
		k = Klass.new
		assert_equal "Hello from Klass", k.hello
		k.extend(Mod)
		assert_equal "Hello from Mod", k.hello			
	end
end
