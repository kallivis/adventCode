require 'csv'
keypad = [[0,0,1,0,0],[0,2,3,4,0],[5,6,7,8,9],[0,'A','B','C',0],[0,0,'D',0,0]]
input_file = './input.csv'
position = {x: 0, y: 2}
code = []
CSV.foreach(input_file) do |row|
  row.each do |str|
    (0..str.length - 1).each do |i|
      previous_x = position[:x]
      previous_y = position[:y]
      case str[i]
      when 'L'
        if position[:x] > 0
          position[:x] -= 1
        end
      when 'R'
        if position[:x] < keypad[position[:y]].length - 1
          position[:x] += 1
        end
      when 'U'
        if position[:y] > 0
          position[:y] -= 1
        end
      when 'D'
        if position[:y] < 4
          position[:y] += 1
        end
      end
     if keypad[position[:y]][position[:x]] == 0
       position[:x] = previous_x
       position[:y] = previous_y
     end
    end
    code << keypad[position[:y]][position[:x]]
  end
end
puts code.to_s

