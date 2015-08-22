class Dictionary
  def initialize(entries = {})
  	@entries = entries
  end
  def entries
  	@entries
  end
  def add(addition)
  	if addition.is_a?(Hash)
	  	addition.each_with_index do |value, index|
	  		@entries[value[0]] = value[1]
	  	end
	elsif addition.is_a?(String)
		@entries[addition] = nil
	end
  end
  def keywords
  	@entries.keys.sort
  end
  def include?(str)
  	(self.keywords.include? str) ? true : false
  end
  def find(str)
  	result = {}
  	self.keywords.each do |word|
  		if word =~ /#{str}\w*/
  			result[word] = @entries[word]
  		end
  	end
  	result
  end
  def printable
  	result = ""
  	self.keywords.each_with_index do |word, index|
  		result += %Q|[#{word}] "#{@entries[word]}"|
  		if index < self.keywords.length - 1
  			result += "\n"
  		end
  	end
  	result
  end
end
