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
out = "_____"
while attempts > 0
	puts "enter your guess: "
	guesses.push(gets)
	if words.select { |string| string.include?(guesses[-1])} != words
		words.map! { |string| if string.include?(guesses[-1])
					string.clear
				else
					string
				end}.uniq!
		attempts -= 1
		guesses.each { |string| if string
						string.strip!
						print "#{string} "
					end}
		puts "(#{attempts} chances left)\n"
	else
		target = words[0]
		guesses.each
	end	
end
puts words
