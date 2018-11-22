module CitiesHelper
	def next_five_days
		require 'date'

		current_time = Time.now
		year = current_time.year
		month = current_time.month
		day = current_time.day

		date = Date.new(year, month, day)

		['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']

		if date.monday?
			['Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']

		elsif date.tuesday?
			['Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']

		elsif date.wednesday?
			['Thursday', 'Friday', 'Saturday', 'Sunday', 'Monday']

		elsif date.thursday?
			['Friday', 'Saturday', 'Sunday', 'Monday', 'Tuesday']

		elsif date.friday?
			['Saturday', 'Sunday', 'Monday', 'Tuesday', 'Wednesday']

		elsif date.saturday?
			['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday']

		else
			['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday']

		end
	end
end
