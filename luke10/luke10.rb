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


#data = Array[1, 2, 3, 4, 5]

for i in 1..data.length-1 do
	for j in 1..i-1 do
		puts "i#{ i }j#{ j } profit #{data[i]-data[j]}"
		diffs << data[i]-data[j]
	end
end

#diffs.each do |value|
#	puts value
#end




