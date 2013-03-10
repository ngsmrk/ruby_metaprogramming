class ClassEnhancementTest < Test::Unit::TestCase
	class Bob
		class << self
			def enhance klass
				puts "Enhancing #{self} with class #{klass}"
				self.send(:include, klass)
			end
		end
	end

	module Logger
		def my_log
		end
	end

	def test_adding_module_changes_existing_instances
		b = Bob.new
		assert_equal false, b.respond_to?(:my_log)		
		Bob.enhance Logger
		assert_equal true, b.respond_to?(:my_log)
	end
end