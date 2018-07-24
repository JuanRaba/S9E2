# class Roulette

class Roulette
  def initialize
    @r = (1..10).to_a
  end

  def play(apuesta)
    r = rand(@r.size)
    puts resultado = @r[r]
    nice = (apuesta == resultado)
    append(resultado, nice)
    nice
  end

  def append(num, nice)
    File.open('roulette_history.txt', 'a') do |file|
      file.puts(num)
    end
    if nice
      File.open('winners.txt', 'a') do |file|
        file.puts(num)
      end
    end
  end

  def max_historical
    File.open('roulette_history.txt', 'r') do |file|
      arr = file.readlines
      puts arr.to_s
      freq = arr.inject(Hash.new(0)) do |h, v|
        h[v] += 1
        h
      end
      puts freq
      arr.max_by { |v| freq[v] }
    end
  end
end

r = Roulette.new

puts r.play(9)
puts "el que mas ocurrio fue #{r.max_historical}"
