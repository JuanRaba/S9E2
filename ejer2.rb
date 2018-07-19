# class Course

require 'date'

class Course
  def initialize(name, *dates)
    @name = name
    @dates = dates.map { |e| Date.parse(e) }
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
