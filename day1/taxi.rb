class TaxiCab
  require 'csv'
  def initialize
    @current_heading = :north
    @totals = {north: 0, south: 0, east: 0, west: 0}
    @total_x = 0
    @total_y = 0
    @visited = [{x: 0, y: 0}]
    @hq_cords = nil
  end

  def record_route(input_file)
    CSV.foreach(input_file) do |row|
      row.each do |entry|
        entry = entry.delete(' ')
        direction_change = entry[0]
        distance = entry[1, entry.length - 1].to_i
        before_x = @totals[:east].to_i - @totals[:west].to_i
        before_y = @totals[:north].to_i - @totals[:south].to_i
        @current_heading = calculate_heading(direction_change)
        @totals[@current_heading] += distance
        after_x = @totals[:east].to_i - @totals[:west].to_i
        after_y = @totals[:north].to_i - @totals[:south].to_i
        (1..distance).each do |i|
          if before_x == after_x
            if @current_heading == :north
              current_visit = {x: before_x , y: before_y + i}
            else
              current_visit = {x: before_x , y: before_y - i}
            end
          else
            if @current_heading == :east
              current_visit = {x: before_x + i , y: before_y}
            else
              current_visit = {x: before_x - i , y: before_y}
            end
          end
          if !@hq_cords && @visited.include?(current_visit)
            @hq_cords = current_visit
          else
            @visited << current_visit
          end
        end
      end
    end
    calculate_x_and_y
  end

  def calculate_heading(direction_change)
    heading = case @current_heading
              when :north
                if direction_change == "R"
                  :east
                else
                  :west
                end
              when :south
                if direction_change == "R"
                  :west
                else
                  :east
                end
              when :east
                if direction_change == "R"
                  :south
                else
                  :north
                end
              when :west
                if direction_change == "R"
                  :north
                else
                  :south
                end
              end
  end

  def calculate_x_and_y
    @total_x = @totals[:east].to_i - @totals[:west].to_i
    @total_y = @totals[:north].to_i - @totals[:south].to_i
  end
  def total_x
    @total_x
  end
  def total_y
    @total_y
  end
  def total
    @total_x.abs + @total_y.abs
  end
  def hq_cords
    @hq_cords
  end
  def hq_distance
    @hq_cords[:x].abs + @hq_cords[:y].abs
  end
end

