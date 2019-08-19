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

  def blur(distance)
    ones = find_ones

    @array_of_arrays.each_with_index do | row, index_of_row |
      row.each_with_index do | number, index_of_number |
        ones.each do | row_of_one, col_of_one |
          if manhattan(index_of_number, index_of_row, col_of_one, row_of_one) <= distance
            @array_of_arrays[index_of_row][index_of_number] = 1
          end
        end
      end
    end
  end

  def manhattan (x1, y1, x2, y2)
    horizontal_distance = (x2 - x1).abs
    vertical_distance = (y2 - y1).abs
    horizontal_distance + vertical_distance
  end

  def output_image()
    for array in @array_of_arrays do
      puts(array.join(""))
    end
  end
end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 1]
])
image.output_image
puts
image.blur(2)


image.output_image