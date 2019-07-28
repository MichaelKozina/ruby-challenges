class Image
  attr_accessor :data

  def initialize (data)
    @data = data
  end

  # returns the distance between two cells
  def manhattan_distance(start_row, start_col, end_row, end_col)
    (end_row - start_row).abs + (end_col - start_col).abs
  end

  def blur_v3(distance)
    data_copy = Marshal.load(Marshal.dump(data))
    data_copy.each_with_index do |row, row_index|
      row.each_with_index do |pixel, column_index|
        if data_copy[row_index][column_index] == 1
          data.each_with_index do |r, ri|
            r.each_with_index do |px, ci|
              if manhattan_distance(row_index, column_index, ri, ci) <= distance
                data[ri][ci] = 1
              end
            end
          end
        end
       end
    end
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
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0]
])

data.blur_v3(3)
data.output_image