require './taxi.rb'
taxi = TaxiCab.new
taxi.record_route("input.csv")
puts "HQ Cords #{taxi.hq_cords}"
puts "HQ Distance #{taxi.hq_distance}"

