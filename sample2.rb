jugadores = ['Felix', 'Koke', 'Suarez']
jugadores.each.with_index(8) { |jugador, i| puts "#{i}: #{jugador}" }
jugadores.map.with_index { |jugador, i| puts "#{i}: #{jugador}" }
print jugadores.delete_if.with_index { |jugador, i| jugador.include?('F') && i.even? }

print jugadores.each
print jugadores.map

dimensions = [
  [10, 20],
  [30, 40],
  [50, 60],
]

areas = []

dimensions.each do |length, width|
  areas << length * width
  # areas.push(length * width)
end

print areas

dimensions.each.with_index(1) do |(length, width), i|
  areas << "length: #{length}, width: #{width}, #{i}番"
end

dimensions.each_with_index do |(length, width), i|
  areas << "length: #{length}, width: #{width}, #{i}番"
end

print areas

names = ["Joao", "Yanick", "Marcos"]

print names.map { |name| "#{name}さん" }.join("と")

names.each do |name|
  print "#{name}さん"
end.join("と")

File.open("./sample.text", "w") do |file|
 file.puts("Que grande")
 file.puts("Cabron")
 file.puts("Joder")
end

sum = 0
5.times { |n| sum += n} #nには添字が0から入る 
puts sum

gol = 0
30.times { |n| gol += n}
puts gol.to_s + "goles"

a = []
10.upto(20) { |n| a << n}
print a

a = []
10.downto(2) { |n| a << n}
print a

jornada = []
1.step(36, 2) { |n| jornada << n}
print jornada

wallet = []
while wallet.size < 10
  wallet << 100
end
print wallet

wallet << 100 while wallet.size < 10
print wallet

price = [10, 50, 100, 200, 1000]
until price.size < 3  #until 条件式(偽であれば実行)　whileの逆
  price.delete_at(-1)
end
print price

numbers = [1,2,3,4,5]
loop do
  n = numbers.sample #sampleメソッドでランダムに配列から要素を取得
  puts n
  break if n == 5
end