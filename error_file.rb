def bubble_sort(arr)
  arr_sort = arr.sort
  while arr != arr_sort
    0..arr.length - 2.each do |i|
      arr[i], arr[i + 1] = arr[i + 1], arr[i] if arr[i] > arr[i + 1]
    end
  end
  print arr
end
  def bubble_sort_by(arr) 

sorted = false
  until sorted
    sorted = true
    0..arr.length - 2.each do |i|
      comparison = yield arr[i], arr[i + 1]
      if comparison.positive?
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        sorted = false
      end
  end
  end
  p arr
end
puts 'this line is supposed to be 120 characters length,  this line has space at the end. Please delete the space after' 