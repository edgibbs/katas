class BinarySearch
  
  # First simplistic binary search no splitting
  # def chop(int, array)
  #   
  #   for index in (0...array.length)
  #     if array[index] == int 
  #       return index
  #     end
  #   end
  #   return -1
  # end
  
  # Second binary search looking at high and low and starting from the closet
  # def chop(int, array)
  #   if array.empty?
  #     return -1
  #   end
  #   if (int - array.first).abs <= (int - array.last).abs
  #     return search_from_front(int, array)
  #   else
  #     return search_from_back(int, array)
  #   end 
  # end
  # 
  # private
  # 
  # def search_from_front(int, array)
  #   for index in (0...array.length)
  #     if array[index] == int
  #       return index
  #     end
  #   end
  #   return -1
  # end
  # 
  # def search_from_back(int, array)
  #   for index in (0...array.length)
  #     if array[(array.length - 1) - index] == int
  #       return (array.length - 1) - index
  #     end
  #   end
  #   return -1
  # end
  
  def chop(int, array)
    if array.empty?
      return -1
    end
    if array.length == 1 && array.first == int
      return 0
    end
    middle = (array.length - 1) / 2
    if array.length > 2
      if array[middle] == int
        return middle
      end
      if int > array[middle]
        return search_up(int, array, middle)
      else
        return search_down(int, array, middle)
      end      
    end
    return -1
  end
  
private
  
  def search_up(int, array, middle)
    for index in (middle...array.length)
      if array[index] == int
        return index
      end
    end
    return -1
  end
  
  def search_down(int, array, middle)
    for index in (0..middle)
      if array[middle - index] == int
        return middle - index
      end
    end
    return -1
  end

  
end