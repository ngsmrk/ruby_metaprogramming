class Train
  def self.metaclass
    class << self; self; end
  end

  def self.depart
  end
end

class MetaClassTest < Test::Unit::TestCase

	def test_get_meta_class
		assert_equal true, Train.metaclass.instance_methods.include?(:depart)
	end
end