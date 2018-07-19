# class Table
class Table
  def initialize(name, *days)
    @name = name
    @days = days.map &:to_i # { |e| e.to_i }
  end

  def max
    @days.each_with_index.max
  end

  def avg
    @days.reduce(:+) / @days.size.to_f
  end
end

def load_casino(casino)
  data = []
  File.open('casino.txt', 'r') { |file| data = file.readlines }

  data.each do |prod|
    ls = prod.chomp.split(', ')
    casino << Table.new(*ls)
  end
end

casino = []
load_casino(casino)

def max_day(casino)
  casino.each do |table|
    day = table.max
    puts "#{day[0]} el dia #{day[1]}"
  end
end
max_day(casino)

def avg(casino)
  casino.inject (0) { |mem, table| mem + table.avg.to_i }
end
puts avg(casino) / casino.size.to_f

