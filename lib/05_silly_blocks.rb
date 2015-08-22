def reverser
	result = []
	yield.split(' ').each {|e| result.push(e.reverse)}
	result.join(' ')
end
def adder(x = 1)
	yield + x
end
def repeater(x = 1)
	x.times do		
	yield
	end
end
