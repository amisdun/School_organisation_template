def arr(arr)
    pivot = ((arr.length - 1)/2).floor()
    count_left = 0
    count_right = 0
    arr.each_index do |index|
        if index < pivot
            count_left += arr[index]
        elsif index > pivot
            count_right += arr[index]
        end
    end

    if count_left === count_right
        return pivot
    else
        return -1
    end
end

puts arr([1,4,6,3,2])