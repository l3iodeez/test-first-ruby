class Timer
	def seconds
		@time = 0
		@time
	end
	def seconds=(num)
		@time = num
		@time
	end
	def time_string
		Time.at(@time).utc.strftime("%H:%M:%S")
	end
end