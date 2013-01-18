class CarModel
  # define a class macro for setting features
  def self.features(*args)
    args.each do |feature|
      attr_accessor "#{feature}_price", "#{feature}_info"
    end
  end

  # set _info and _price methods for each of these features
  features :engine, :wheel, :airbag, :alarm, :stereo
end

class AddVariablesDynamicallyTest < Test::Unit::TestCase

	def test_add_variables

		cm = CarModel.new
		cm.engine_price = 100.0
		assert_equal 100.0, cm.engine_price

	end
end