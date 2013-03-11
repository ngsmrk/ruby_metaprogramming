class IncludedHookTest < Test::Unit::TestCase

	module TestModule
		def self.included(mod)
			puts "#{self} included in #{mod}"		
		end

		def self.extended(mod)
			puts "#{self} extended in #{mod}"		
		end		
	end

	class Bob
		include TestModule
	end

	def test_included
		assert_equal true, Bob.included_modules.include?(TestModule)
	end

	class Fred
		extend TestModule
	end

	def test_extended
		assert_equal true, Fred.singleton_class.included_modules.include?(TestModule)
	end	
end