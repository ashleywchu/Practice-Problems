# Bubble Sort

def BubbleSort(arr)
	sorted = false
	until sorted
		sorted = true
		(arr.count - 1).times { |i|
			if arr[i] > arr[i + 1]
				arr[i], arr[i + 1] = arr[i + 1], arr[i]
				sorted = false
			end
		}
	end
	arr
end