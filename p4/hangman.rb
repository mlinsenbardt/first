#!/user/bin/env ruby

f = File.open("words","r")
words = Array.new
f.each do  |line| 
		words.push(line)
	 end
puts "Enter word length between 5-20: "
range = gets 
 
words.map! { |string| string.strip!
		if string.size == range.to_i
			string
		else
			string.clear
		end}.uniq!
ATTEMPTS = 10
guesses = Array.new(range)
out = "_____"
while ATTEMPTS > 0
	puts "enter your guess: "
	guesses.push(gets)
	if words.select { |string| string.include?(guesses[-1])}.count != words
		words.map! { |string| if string.include?(guesses[-1])
					string.clear
				else
					string
				end}.uniq!
		ATTEMPTS -= 1
	else
		target = words[0]
		guesses.each	
	puts ATTEMPTS
end
#puts words
