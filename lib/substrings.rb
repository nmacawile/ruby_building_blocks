def substrings(text, vocabulary)
	sub_strings = {}
	
	words = text.downcase.split
	
	words.each do |word|
		vocabulary.each do |vocabulary_word|
			if word.include?(vocabulary_word)
				sub_strings[vocabulary_word] += 1
			end
		end
	end 
	sub_strings
end

dictionary = %w(below down go going horn how howdy it i low own part partner sit)
    
puts substrings("below", dictionary)
substrings("below", dictionary)
#{"below"=>1, "low"=>1}
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
#{"down"=>1, "how"=>2, "howdy"=>1,"go"=>1, "going"=>1, "it"=>2, "i"=> 3, "own"=>1,"part"=>1,"partner"=>1,"sit"=>1}