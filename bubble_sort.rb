def bubble_sort(array)
	sorted = false
	(array.length).downto 1 do |limit|
		unless sorted
			sorted = true
			for i in (1...limit)
				left = i - 1
				right = i
				if (array[left] > array[right])
					array[left], array[right] = array[right], array[left]
					sorted = false
				end
			end
			p array
		end
	end
	p array
end

def bubble_sort_by(array)
	sorted = false
	(array.length).downto 1 do |limit|
		unless sorted
			sorted = true
			for i in (1...limit)
				left = i - 1
				right = i			
				if yield(array[left], array[right]) > 0
					array[left], array[right] = array[right], array[left]
					sorted = false
				end
			end
		p array
		end
	end
	p array
end

bubble_sort([4, 3, 78, 2, 0, 2])
#[0,2,2,3,4,78]

bubble_sort_by(["hi", "hello", "hey"]) do |left, right|
	left.length - right.length
end
#["hi", "hey", "hello"]