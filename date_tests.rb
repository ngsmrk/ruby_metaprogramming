require 'active_support/all'

Time.zone = "Hawaii"

class DateTest < Test::Unit::TestCase
	def test_date_is_correct
		# never use Date.today always use Date.current
		correct_date = Date.current
		assert_not_equal Date.today, correct_date
		assert_equal correct_date.day, Time.zone.now.day
		assert_equal correct_date.month, Time.zone.now.month
		assert_equal correct_date.year, Time.zone.now.year
	end
	def test_datetime_is_correct
		# never use Date.current.to_time always use Date.current.to_time_in_current_zone - otherwise you lose the offset
		correct_date_time = Date.current.to_time_in_current_zone
		assert_equal "Hawaii", Date.current.to_time_in_current_zone.time_zone.name

		incorrect_date_time = Date.current.to_time
		assert_raise NoMethodError do
		  incorrect_date_time.time_zone  #Raises NoMethodError because this date has no timezone
		end
	end
end

class TimeTest < Test::Unit::TestCase
end