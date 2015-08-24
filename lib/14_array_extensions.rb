class Array 
	def sum
		sum = 0
		self.each do |x|
			(x.is_a? Numeric) ? sum += x : nil
		end
		sum
	end
	def square
		result = []
		self.each do |x|
		 	(x.is_a? Numeric) ? result.push(x*x) : nil
		end
		result
	end
	def square!
		self.collect! do |x|
		 	(x.is_a? Numeric) ? x = x*x : nil
		end
	end
end