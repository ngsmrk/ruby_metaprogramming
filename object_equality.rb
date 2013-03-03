class ObjectEqualityTest < Test::Unit::TestCase
	def test_equal
		assert_equal false, Object.new ==   Object.new, "Object should not match using =="
		assert_equal false, Object.new ===  Object.new, "Object should not match using ==="
		assert_equal false, Object.new.eql?(Object.new), "Object should not match using eql?"
		assert_equal false, Object.new.equal?(Object.new), "Object should not match using equal?"						
	end	
end