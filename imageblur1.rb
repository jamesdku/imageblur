class Image
  def initialize image
    @image = image
  end

  def output_image
    @image.each { |n| puts n.join }
  end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image

end