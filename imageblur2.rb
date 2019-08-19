class Image

  def initialize (array_of_arrays)
    @array_of_arrays  = array_of_arrays
  end

  def find_ones 
    new_array = []
    @array_of_arrays.each_with_index do | row, index_of_row | 
      row.each_with_index do | number, index_of_number | 
        if number == 1
          new_array << [index_of_row, index_of_number]
        end
      end
    end
    new_array
  end

  def blur 
    ones = find_ones
    @array_of_arrays.each_with_index do | row, index_of_row |
      row.each_with_index do | number, index_of_number |
        ones.each do | row_of_one, col_of_one |
          if index_of_row == row_of_one && index_of_number == col_of_one
            @array_of_arrays[index_of_row - 1][index_of_number] = 1 unless index_of_row == 0
            @array_of_arrays[index_of_row + 1][index_of_number] = 1 unless index_of_row >= 3
            @array_of_arrays[index_of_row][index_of_number - 1] = 1 unless index_of_number == 0
            @array_of_arrays[index_of_row][index_of_number + 1] = 1 unless index_of_number >= 3
          end
        end
      end
    end
  end

  def output_image()
    for array in @array_of_arrays do
      puts(array.join(""))
    end
  end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
puts
image.blur


image.output_image