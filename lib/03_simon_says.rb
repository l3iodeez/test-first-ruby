
def echo(str)
	str
end
def shout(str)
	str.upcase
end
def repeat(str, num = 2)
	array = []
	num.times do |e|
	array.push(str) 
	end
	array.join(' ')
end
def start_of_word(str,num)
	str.slice(0,num)
end
def first_word(str)
	str.split(' ')[0]
end
def titleize(str)
	words = str.split(' ')
	little_words = ['of','and','in','by','the', 'over']
	index = 0
	words.collect do |word|
		if (little_words.include? word.downcase) == false || index == 0
			word[0] = word[0].upcase
		end	
		index += 1
	end
	words.join(' ')
end