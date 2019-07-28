class Image
  attr_accessor :data

  def initialize (data)
    @data = data
  end

  def output_image
    data.each do |row|
      row.each do |cell|
        print cell
      end
      puts
    end
  end
end

data = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

data.output_image