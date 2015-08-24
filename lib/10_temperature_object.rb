class Temperature
 def initialize(opt = {})
 	if not opt[:f].nil?
 		 @kelvins = (opt[:f] + 459.67)  * 5.0 / 9.0
 		 @kelvins
 	elsif not opt[:c].nil?
 		 @kelvins = opt[:c] + 273.15
 		 @kelvins
 	elsif not opt[:k].nil?
 		@kelvins = opt[:k]
 		@kelvins
 	end	
 end
 def in_celsius
 	(@kelvins - 273.15).round(1)
 end
 def in_fahrenheit
 	((@kelvins- 273.15) * 1.8000 + 32.00).round(1)
 end
 def in_kelvins
 	@kelvins.round(2)
 end
 def self.from_celsius(deg)
 	Temperature.new(:c => deg)
 end
 def self.from_fahrenheit(deg)
 	Temperature.new(:f => deg)
 end
  def self.from_kelvin(k)
 	Temperature.new(:k => k)
 end
 def self.ftoc(deg)
	Temperature.from_fahrenheit(deg).in_celsius
 end
 def self.ctof(deg)
	Temperature.from_celsius(deg).in_fahrenheit
 end
end
 class Celsius < Temperature
 	def initialize(num)
 		super(:c => num)
 	end
 end
 class Fahrenheit < Temperature
 	def initialize(num)
 		super(:f => num)
  	end
 end
  class Kelvin < Temperature
 	def initialize(num)
 		super(:k => num)
  	end
 end