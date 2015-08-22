class Friend
  def greeting(str = false)
  	if str && @myname
  		"Hello, #{str}! My name is #{@myname}."
  	elsif @myname
  		"Hello! My name is #{@myname}"
  	elsif str
  		"Hello, #{str}!"
  	else
  		"Hello!"
  	end
  end
  def setname(name)
  	@myname = name
  end
  def getname
  	"My name is #{@myname}"
  end
end
