#!/user/bin/env ruby

f = File.open("words","r")
words = Array.new
f.each do  |line| 
		words.push(line)
	 end
puts "Enter word length between 5-20: "
range = gets 
if range.to_i <5
	range = "5"
elsif range.to_i >20
	range = "20"
end
words.select! { |string| string.strip!
		string.size == range.to_i}
attempts = 10
guesses = Array.new(range.to_i)
out = '_' *range.to_i
target = ""
while attempts > 0 && out != target
	puts "enter your guess: "
	guess = gets[0]
	if guesses.include? guess
		puts "you already guessed #{guess}\n"
	elsif !guess.index(/[a-z]/)
		puts "only lowercase letters a-z are allowed\n"
	else
		guesses.push(guess)
		#if guesses[-1][0].is_a?
		if words.select { |string| string.include? guesses[-1][0]}.count != words.count && target == ""
			words.delete_if { |string| string.include? guesses[-1][0]}	
			attempts -= 1
		elsif target == ""
			target = words[0]
			out[target.index(guesses[-1][0])] = guesses[-1][0]
		elsif target.index(guesses[-1][0])
			out[target.index(guesses[-1][0])] = guesses[-1][0]
		else
			attempts -= 1
		end
		guesses.each { |string| if string
						string.strip!
						print "#{string} "
					end}
		puts "(#{attempts} chances left)\n"	
		puts out
	end
end
	if out == target
		puts "\nYOU WIN!\n"
	else
		puts "\nYOU LOSE\n"
	end
