class RPNCalculator < Array
	def initialize
		@numbers = []
	end
	def push(num)
		@numbers.push(num)
	end
	def value
		@numbers[-1]
	end
	def plus
		self.check
		one = @numbers.pop
		two = @numbers.pop
		@numbers.push(one + two)
		@numbers[-1]
	end
	def times
		self.check
		one = @numbers.pop
		two = @numbers.pop
		@numbers.push(one * two)
		@numbers[-1]
	end
	def minus
		self.check
	    one = @numbers.pop
		two = @numbers.pop
		@numbers.push(two - one)
		@numbers[-1]
	end
	def divide
		self.check
		one = @numbers.pop
		two = @numbers.pop
		@numbers.push(two.to_f / one.to_f)
		@numbers[-1]
	end
	def check
		@numbers.length < 1 ? raise("calculator is empty") : nil
		@numbers.length < 2 ? raise("only one value in stack") : nil
	end
	def tokens(str)
		operators = [:+,:-,:*,:/]
		tokens = str.split(' ')
		tokens.collect do |e|
			if operators.include?(e.to_sym)
				e = e.to_sym
			elsif e != "0" && e.to_i == 0
				raise("unable to tokenize string check syntax")
			elsif e.to_i == e.to_f
				e = e.to_i
			elsif e.to_i != e.to_f
				e = e.to_f					
			end
		end
	end
	def evaluate(str)
		inputs = self.tokens(str)
		inputs.each do |item|
			if item.is_a?(Float) || item.is_a?(Integer)
				self.push(item)
			elsif item == :+
					self.plus
			elsif item == :-
					self.minus
			elsif item == :*
					self.times
			elsif item == :/
					self.divide
			end
		end
		self.value

	end
end