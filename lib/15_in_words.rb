class Fixnum
	def place_to_words(place = self)
		number_dict = {
			:"0" => "",
			:"00" => "",
			:"1" => "one",
			:"2" => "two",
			:"3" => "three",
			:"4" => "four",
			:"5" => "five",
			:"6" => "six",
			:"7"=> "seven",
			:"8"=> "eight",
			:"9"=> "nine",
			:"10" => "ten",
			:"11" => "eleven",
			:"12" => "twelve",
			:"13" => "thirteen",
			:"14" => "fourteen",
			:"15" => "fifteen",
			:"16" => "sixteen",
			:"17" => "seventeen",
			:"18" => "eighteen",
			:"19" => "nineteen",
			:"20" => "twenty",
			:"30" => "thirty",
			:"40" => "forty",
			:"50" => "fifty",
			:"60" => "sixty",
			:"70" => "seventy",
			:"80" => "eighty",
			:"90" => "ninety",
			:"100"=> "hundred",
		}
		result = ""
		if place == 77
			#binding.pry
		end
		if place >= 100
			result += number_dict[(place/100).to_s.to_sym]
			result += " " + number_dict[:"100"]
			if place % 100 > 0
				result += " "
			end
		end
		if place % 100 >= 20
			result += number_dict[(((place % 100)/10).to_s + "0").to_sym]
			if place % 10 > 0
				result += " "
			end
		elsif place % 100 > 9 
			result += number_dict[(place % 100).to_s.to_sym]
		end
		if place < 10 && place % 10 > 0
			result += number_dict[(place % 10).to_s.to_sym]
		elsif  place % 100 >= 20 && place % 10 > 0
			result += number_dict[(place % 10).to_s.to_sym]
		end
		result
	end
	def in_words
		result = ""

		place = {}
		place[:trillions] = (self / 1000000000000) % 1000
		place[:billions ] = (self / 1000000000) % 1000
		place[:millions ] = (self / 1000000) % 1000
		place[:thousands ] = (self / 1000) % 1000
		place[:hundreds] = self % 1000
		if place[:trillions] > 0
			result += place[:trillions].place_to_words + " trillion"
			if place[:billions] > 0 || place[:millions] > 0 || place[:thousands] > 0 || place[:hundreds] > 0
				result += " "
			end
		end
		if place[:billions] > 0
			result += place[:billions].place_to_words + " billion"
			if place[:millions] > 0 || place[:thousands] > 0 || place[:hundreds] > 0
				result += " "
			end
		end
		if place[:millions] > 0
			result += place[:millions].place_to_words + " million"
			if place[:thousands] > 0 || place[:hundreds] > 0
				result += " "
			end
		end
		if place[:thousands] > 0
			result += place[:thousands].place_to_words + " thousand"
			if place[:hundreds] > 0
				result += " "
			end
		end
		if place[:hundreds] > 0
			result += place[:hundreds].place_to_words
		end
		if result == ""
			result = "zero"
		end
		result
	end

end
