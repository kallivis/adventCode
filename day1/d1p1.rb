require './taxi.rb'
taxi = TaxiCab.new
taxi.record_route("input.csv")
puts "Total x #{taxi.total_x}"
puts "Total y #{taxi.total_y}"
puts "Total #{taxi.total}"

