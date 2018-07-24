# class Course

require 'date'

class Course
  def initialize(name, *dates)
    @name = name
    @dates = dates.map { |e| Date.parse(e) }
  end

  def starts_before(date=Date::today)
    check_date(date)
    @name if @dates[0] < date
  end

  def ends_after(date=Date::today)
    check_date(date)
    @name if @dates[1] > date
  end

  def check_date(date)
    raise ArgumentError, 'date  >= 2018-01-01' if date  >= Date.parse('2018-01-01')
  end
end

def load_academi(casino)
  data = []
  File.open('cursos.txt', 'r') { |file| data = file.readlines }

  data.each do |prod|
    ls = prod.chomp.split(', ')
    casino << Course.new(*ls)
  end
end

academi = []
load_academi(academi)

date = Date.parse('2017-05-17')
def show_starts_before(academi, date=Date::today)
  academi.each do |c|
    puts c.starts_before(date)
  end
end
show_starts_before(academi, date)
