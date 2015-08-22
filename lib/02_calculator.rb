require 'pry'
require 'pry-nav'

def add(num1, num2)
	num1 + num2
end
def subtract(num1,num2)
	num1 - num2
end
def sum(array)
	sum = 0
	array.map{|num| sum += num}
	sum
end
def multiply(array)
	product = 1
	array.map{|num| product *= num}
	product
end
def power(num1, num2)
	product = 1
	num2.times do
	 product *= num1
	end
	product
end
def factorial(num)
	if num == 0 || num == 1
		return 1
	else
		return factorial(num -1) * num
	end
end

