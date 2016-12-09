require 'csv'
keypad = [[1,2,3],[4,5,6],[7,8,9]]
input_file = './input.csv'
position = {x: 1, y: 1}
code = []
CSV.foreach(input_file) do |row|
  puts "!!!!!!!!!"
  puts row[0][0]
  row.each do |str|
    (0..str.length - 1).each do |i|
      case str[i]
      when 'L'
        if position[:x] > 0
          position[:x] -= 1
        end
      when 'R'
        if position[:x] < 2
          position[:x] += 1
        end
      when 'U'
        if position[:y] > 0
          position[:y] -= 1
        end
      when 'D'
        if position[:y] < 2
          position[:y] += 1
        end
      end
    end
    code << keypad[position[:y]][position[:x]]
  end
end
puts code.to_s

