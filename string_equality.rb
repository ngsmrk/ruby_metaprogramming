class StringEqualityTest < Test::Unit::TestCase
	def test_equal
		assert_equal true, "x" ==   "x", "String did not match using =="
		assert_equal true, "x" ===  "x", "String did not match using ==="
		assert_equal true, "x".eql?("x"), "String did not match using eql?"
		assert_equal false, "x".equal?("x"), "String unexpectedly matched using equal?"						
	end
end