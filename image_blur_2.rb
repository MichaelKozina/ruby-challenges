class Image
  attr_accessor :data

  def initialize (data)
    @data = data
  end

  def blur_v2
    data_copy = Marshal.load(Marshal.dump(data))
    data_copy.each_with_index do |row, row_index|
      row.each_with_index do |pixel, column_index|
        if data_copy[row_index][column_index] == 1
          data[row_index - 1][column_index] = 1 if valid_position?(row_index - 1, column_index)
          data[row_index][column_index + 1] = 1 if valid_position?(row_index, column_index + 1)
          data[row_index + 1][column_index] = 1 if valid_position?(row_index + 1, column_index)
          data[row_index][column_index - 1] = 1 if valid_position?(row_index, column_index + 1)
        end
      end
    end
  end

  def valid_position?(row_index, column_index)
    !(row_index < 0 || column_index < 0 || row_index >= data.length || column_index >= data[row_index].length)
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
  [1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 1]
])

data.blur_v2
data.output_image