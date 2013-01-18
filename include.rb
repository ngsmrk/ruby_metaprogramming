module Mod
  def hello
    "Hello from Mod"
  end
end

class KlassWithInclude
	include Mod
end

class IncludeTest < Test::Unit::TestCase

	def test_include
		k = KlassWithInclude.new
		assert_equal "Hello from Mod", k.hello			
	end
end
