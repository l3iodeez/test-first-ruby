def measure(x = 1)
	start = Time.now
	x.times do
		yield
	end
	(Time.now - start)/x
end