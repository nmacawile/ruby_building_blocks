scode = %w(c f g a)

candidates = []
a = %w(a b c d e f g h)
i=0
a.each do |w|
	a.each do |x|
		a.each do |y|
			a.each do |z|
				candidates << [w, x, y, z]
				i+=1
			end
		end
	end
end

puts candidates.size


module Enumerable
	def update_first_match!(value)
		index = self.find_index(value)
		self[index] = yield(self[index]) unless index.nil?
	end
end


def check(code, guess)
	#guess = %w(aabb)

	almost_match = 0
	direct_match = 0

	code_copy = code.clone
	indices = []
	guess.each_with_index do |char, index|
		if code[index] == char
			direct_match += 1
			code_copy[index] = nil
		else
			indices << index
		end
	end

	guess.values_at(*indices).each do |char|
		if code_copy.include?(char)
		
			almost_match += 1
			code_copy.update_first_match!(char) { nil }
		end
	end


	#p code
	#p code_copy
	#p guess
	[direct_match, almost_match]
end


candidates.delete_if do |candidate|
	guess = %w(a a b b)
	check(candidate,guess) != check(scode,guess) 
end


candidates.delete_if do |candidate|
	guess = %w(c c d d)
	check(candidate,guess) != check(scode,guess) 
end

candidates.delete_if do |candidate|
	guess = %w(e e f f)
	check(candidate,guess) != check(scode,guess) 
end

candidates.delete_if do |candidate|
	guess = %w(g g h h)
	check(candidate,guess) != check(scode,guess) 
end

bb = candidates.first

candidates.delete_if do |candidate|
	guess = bb
	check(candidate,guess) != check(scode,guess) 
end

bb = candidates.first

candidates.delete_if do |candidate|
	guess = bb
	check(candidate,guess) != check(scode,guess) 
end

candidates[0..25].each do |candidate|
	puts candidate.join

end
puts candidates.size



