puts 1 + 2

a = 'Hello'
puts a

require 'date'
puts Date.today

a = [20,40,50]
a[0] = 100
puts a
p a
print a
a[8] = 99
print a
a.delete_at(8)
print a

a, b = [1000, 90]
p a
p b

numbers = [1,90,22,190]
sum = 0
numbers.each do |f|
  sum += f
end

puts sum

numbers = [1,3,4,55,5553]
new_numbers = []
numbers.each {
|n| new_numbers << n * 10}
print new_numbers

numbers = [1,3,4,55,5553]
new_numbers = numbers.map{ |n| n * 10}
print new_numbers

numbers = [1,3,4,55,5553]
even_numbers = numbers.select{ |n| n.even? }
print even_numbers

numbers = [1,3,4,55,5553]
sum = numbers.inject(0) { |result, n| result + n }
puts sum

range = 1..98
if range.include?(3)
puts "ok"
end

range = 1..98
if range.include?(1009)
puts "ok"
else
puts  "No"
end

def charge(age)
  case age
  when 0..5
    0
  when 6..12
    300
  when 13..20
    2000
  else
    10000
  end
end

puts charge(80)

print ("a".."ac").to_a

a = [1, 2, 3, 4, 5]
#二番目から3つ分取得
print a[1,3]
#好きな要素の番号を指定して取得
print a.values_at(0,1,4)
#最後の要素を取得
puts a[a.size - 1]
puts a[-1]
puts a[-2]

#最後から３番目の要素から３つ分取得
print a[-3,3]

puts a.last
print a.last(2)

puts a.first

#6番目に44を追加
a[5] = 44
print a

a[-6] = -33
print a

b = []
b.push(1)
print b
b.push(3,19,28)
print b

# 指定した要素と一致した要素があれば削除する
puts b.delete(3)
print b

# +で連結した場合が元の配列は維持される ←基本的にコッチ
print a + b
print a
# concatは連結された元の配列が変更される
print a.concat(b)
print a


x = [1,2,3,4,5]
y = [2,7,9,3,5]

#和集合
print x | y
#差集合
print x - y
#積集合
print x & y

e, f = 100, 200, 500
puts f
e, *f = 100, 200, 500
print f

x = [1,2,3,4,5]
y = [2,7,9,3,5]

x.push(1000)
print x

#配列の中に配列が、、、
# x.push(y)
# print x

#配列を展開して渡す
x.push(*y)
print x

v = [1,2,3]
print [v]

print x + a + y

# 文字列を配列に変換
word = "Hello, Hola, Selamat"
print word.split(', ')

h = Array.new(5,0)
print h

# 添え字は0から始まる
h = Array.new(10) { |n| n % 3 + 1}
print h

puts 0 % 3 + 1
puts 1 % 3 + 1
puts 2 % 3 + 1
puts 3 % 3 + 1

o = Array.new(5) {'default'}
# !は破壊的メソッド
puts o[0].upcase!
print o

