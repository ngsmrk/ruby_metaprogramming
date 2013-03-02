class NumberEqualityTest < Test::Unit::TestCase
	def test_integer_equal
		assert_equal true,  1 ==   1, "Integer did not match using =="
		assert_equal true,  1 ===  1, "Integer did not match using ==="
		assert_equal true,  1.eql?(1), "Integer did not match using eql?"
		assert_equal true,  1.equal?(1), "Integer did not match using equal?"						
	end
	def test_float_equal
		assert_equal true,  1.0 ==   1.0, "Float did not match using =="
		assert_equal true,  1.0 ===  1.0, "Float did not match using ==="
		assert_equal true,  1.0.eql?(1.0), "Float did not match using eql?"
		assert_equal false, 1.0.equal?(1.0), "Float unexpectedly matched using equal?"						
	end
	def test_mixed_equal
		assert_equal true,  1 ==   1.0, "Integer and Float did not match using =="
		assert_equal true,  1 ===  1.0, "Integer and Float did not match using ==="
		assert_equal false, 1.eql?(1.0), "Integer and Float unexpectedly matched using eql?"
		assert_equal false, 1.equal?(1.0), "Integer and Float unexpectedly matched using equal?"						
	end	
end