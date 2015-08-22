class Book
#alias old_new new

  def title
   	@title
  end
  def title=(str)
  	exclusions = ['the','a','an','to','in','of','and']
  	@title = str.split(' ').each_with_index.map do |e, i| 
		if (exclusions.include? e) == false || (i == 0) || (e == 'i')
			e[0].upcase + e[1..-1] 
		else
			e
		end
	end
  	@title = @title.join(' ')
  	@title
  end
end
