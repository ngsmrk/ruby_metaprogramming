require 'delegate'

class AProxy < SimpleDelegator
end

class AProxyTest < Test::Unit::TestCase

	def test_class
		a_proxy = AProxy.new(Hash.new)
		assert_equal AProxy, a_proxy.class, "Class did not match"
	end

	def test_access_to_delegate
		the_hash = Hash.new
		a_proxy = AProxy.new(the_hash)
		assert_equal a_proxy.__getobj__, the_hash
	end

	def test_nonexistent_method_call
		the_hash = Hash.new
		a_proxy = AProxy.new(the_hash)
		assert_raise(NoMethodError) do
			a_proxy.keyzz
		end
	end

	def test_respond_to
		the_hash = Hash.new
		a_proxy = AProxy.new(the_hash)
		assert_equal true, a_proxy.respond_to?(:keys)
	end	
end