#!/user/bin/env ruby

f = File.open("words","r")
words = Array.new
f.each do  |line| 
		words.push(line)
	 end
puts "Enter word length between 5-20: "
range = gets 
 
words.select! { |string| string.strip!
		string.size == range.to_i}
puts words
attempts = 10
guesses = Array.new(range.to_i)
out = '_' *range.to_i
while attempts > 0
	puts "enter your guess: "
	guesses.push(gets)
	if words.select { |string| string.include? guesses[-1][0]}.count != words.count
		words.delete_if { |string| string.include? guesses[-1][0]}	
		attempts -= 1
		puts words 
		puts guesses[-1]
	else
		target = words[0]
		out[target.index(guesses[-1][0])] = guesses[-1][0]
	end
		guesses.each { |string| if string
						string.strip!
						print "#{string} "
					end}
		puts "(#{attempts} chances left)\n"	
		puts out
end
puts words



