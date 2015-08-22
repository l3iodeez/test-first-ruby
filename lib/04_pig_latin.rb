def translate(str)
	str = str.gsub(/qu/,'q')
	words = str.split(' ')
	vowels = ['a','e','i','o','u']
	two_letter_combos = ['th','ch','ph','sh']
	translated = []
	words.collect do |word|
	if word.downcase == 'my'
		#binding.pry
	end
		translated_word = ""
		punctuation = ""
		if [',','.',';',':','?','!'].include? word[-1]
			punctuation = word[-1]
			word = word[0..-2]
		end
		if vowels.include? word[0].downcase
			translated_word = word + 'ay'
		else
			if (vowels.include? word[1].downcase) || word.length == 2
				translated_word = (word[1..-1] + word[0] + 'ay').downcase
			elsif vowels.include? word[2].downcase
				translated_word = (word[2..-1] + word[0..1] + 'ay').downcase
			else
		 		translated_word = (word[3..-1] + word[0..2] + 'ay').downcase
			end
			if word[0] == word[0].upcase
				translated_word[0] = translated_word[0].upcase
			end
		end
		translated.push(translated_word + punctuation)
	end
	str = translated.join(' ').gsub(/q/,'qu')
end