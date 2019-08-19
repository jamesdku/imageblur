class Image 

  def initialize(array_of_arrays)
    @array_of_arrays = array_of_arrays
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

