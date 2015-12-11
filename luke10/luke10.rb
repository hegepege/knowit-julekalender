#!/usr/bin/ruby

# Hello world ruby program

puts "Reading from file";

data = Array.new

File.open("./data.txt", "r") do |f|
	f.each_line do |line|
		data << line.to_f()
	end
end

diffs = Array.new


#data = data.sample(100)

for i in 1..data.length-1 do
	for j in 0..i-1 do
		if (data[i]-data[j] > 0)
			diffs << {"buy" => j, "sell" => i, "profit" => data[i]-data[j]}
		end
	end
end
puts diffs.length
puts "Finding the sums..."
sums = Array.new

diffs.each do |value1|
	later = diffs.select{ |v| (v["buy"] > value1["sell"]) }
	later.each do |value2|
			sums << value1["profit"] + value2["profit"]
	end
end

puts sums.max



