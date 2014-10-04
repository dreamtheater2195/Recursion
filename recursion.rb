#Fibonacci sequence
def fibs(num)
	curr = 0
	next_num = 1
	while ((num -= 1) > 0)
		temp = curr + next_num
		curr = next_num
		next_num = temp
	end
	next_num
end

def fibs_rec(num)
	(num == 0 || num == 1) ? num : (fibs_rec(num-1)+ fibs_rec(num-2))
end

#Merge sort
def merge(left,right)
	result = []
	while left.length > 0 and right.length > 0
		if (left[0] <= right[0])
			result << left[0]
			left = left[1..-1]
		else 
			result << right[0]
			right = right[1..-1]
		end
	end
	if left.length > 0
		result.concat left
	elsif right.length > 0
		result.concat right
	end
	return result
end

def mergesort(m)
	left, right, result = []   
	if m.length <= 1
		return m
	else 
		mid = m.length/2
		right = m[mid..-1]
		left = m[0..mid - 1]
		
		left = mergesort(left)
		right = mergesort(right)

		if left.last <= right.first
			left.concat right
			return left
		end
		
		result = merge(left,right)
		return result
	end
end



arr = 10.times.map {rand(200)+1}
puts arr.inspect
puts mergesort(arr).inspect