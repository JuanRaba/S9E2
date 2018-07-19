# class Table
class Table
  def initialize(name, *days)
    @name = name
    @days = days
  end
end

def load_casino(casino)
  data = []
  File.open('casino.txt', 'r') { |file| data = file.readlines }

  data.each do |prod|
    ls = prod.split(', ')
    casino << Table.new(*ls)
  end
end

casino = []
load_casino(casino)
puts casino.size
