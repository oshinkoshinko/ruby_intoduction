array = [8, 1, 3, 3, 8, 1, 1, 3, 8, 8]
puts array


array = [10,13,21,1,6,51,10,8,15,6]
if array.include?(21)
  puts "Yes"
else
  puts "No"
end

puts "Yes" if array.include?(15)

#配列の中で指定した要素が何番目か→index(引数)
puts array.index(51)

array1 = [3, 5]
array2 = [1,2,3,4,5]

N = array1[0]
puts array2.index(N)

array3 = [1,1,1,1,2,3,4,4,5,6,6]
puts array3.count(1)
puts array3.count(4)
puts array3.count

#二次元配列
# 二次元配列とは、配列の中に配列の入った、入れ子のデータ構造です。
# 縦横方向にデータを追加していくため、配列(一次元)と比較し、二次元配列と呼びます。
# 二次元配列のことを行列とも呼びます。


array = Array.new(5,1)
p array

#二次元配列作成
array2 = Array.new(3, Array.new(5,4))
p array2  # [[4, 4, 4, 4, 4], [4, 4, 4, 4, 4], [4, 4, 4, 4, 4]]

#二次元配列の要素取得
members = [["太郎","次郎","三郎"],["John","Mary","Mike"]]
p members
puts members[0][0]

members[0][1] = "真也"
p members

members[1].push("花子")
members[1] << "華花子"
p members

members[1].delete_at(4)
p members

#ハッシュ

User = [
  {name:"John",height:175,age:28},
  {name:"Mary",height:165,age:22},
  {name:"Tom",height:183,age:35}
]

p User
p User[0]
p User[0][:name]

array = [[6,5,4,3,2,1],[3,1,8,8,1,3]]
puts array[0]
puts array[1]

puts array.count # 2

puts array[0].count # 6

array = [[1], [2,3], [4,5,6]]
puts array[0].count
puts array[1].count
puts array[2].count

puts array[2][1]

array = [[6,5,4,3,2,1],[3,1,8,8,1,3]]

#配列から要素を半角空白区切りで出力→join
puts array.join(' ') #→6 5 4 3 2 1 3 1 8 8 1 3
puts array[0].join(' ') #6 5 4 3 2 1
puts array[1].join('') #318813

S = "Paiza"
a = "+++++++"
puts a
puts "+#{S}+"
puts a

#日付のゾロ目問題
array = ["22","2"]
m = array[0].to_i
d = array[1].to_i

if m / d == 11
  puts "Yes"
else
  puts "No"
end

# if m[0] == m[1] && m[1] == d
#     puts "Yes"
# else
#     puts "No"
# end

p array.join("").size
p array.uniq.size


numbers = "12345"
puts numbers.chars

# 文字列の置換 gsub=>一括置換 sub=>最初の一箇所置換
H = "aiueokaatnerimaattokyo"
puts H.gsub(/at/, "@")

#　3桁埋め　https://techacademy.jp/magazine/30839
n = 87
puts sprintf("%03d", n) #3d:3桁になるまで 0:0を付ける


#配列に入れて条件分岐
a = "cat"
b = "dog"
c = "cat"

array = Array.new
array.push(a,b,c)
if array.count("cat") >= 2
    puts "cat"
else
    puts "dog"
end

print abc = [1,2,3]

puts 30 / 7

array = [1,10,2,9,3,8,4,7,5,6,1,1]
puts array.index(8) + 1

puts array.count(1)

print array.sort

#配列　最大最小

array = [1,10,2,9,3,8,4,7,5,6,1,1]

p array.uniq
puts array.uniq.sort
p array.max
p array.min
p array.sort.reverse

puts array.join(' ')

#最大最小を同時に取得→minmax
puts array.minmax.join(" ")

#条件を満たす要素を列挙、削除、分割→select,reject,partition
array = [1,10,2,9,3,8,4,7,5,6,1,1]
p array.sort.select { |n| n >= 5 }.join(" ")
p array.reject { |n| n < 3 }
p array.partition { |n| n < 3 }

#配列の平均→inject or each
#配列オブジェクト.inject { ｜初期値, 要素｜ ブロック処理 }
puts array.inject(0) { |sum, array2| sum + array2 } / array.length
#シンボルでスタイリッシュに (:+) 配列の要素を全て足す
puts array.inject(:+) / array.length

array = [1,2,3,4,5]

puts ave = array.inject(:+) / array.length
puts array.select { |n| n >= ave }

# マンハッタン距離(座標間の距離)　(x1 - x2) + (y1 - y2)
# (2,3)基点 (1,2) (5,6)

#多重配列をフラットにして新しい配列を返す flatten
ary = [[1,2,3,4,5],[8,11,23,44,56]]
p ary.flatten #[1, 2, 3, 4, 5, 8, 11, 23, 44, 56]

#配列から指定した複数の要素を取り出し、新しい配列で返す values_at
ary = [1,3,6,7,3]
p ary.values_at(0,2,9) #[1, 6, nil]

#フィボナッチ　 (Fn)はフィボナッチ数列（フィボナッチすうれつ、（英: Fibonacci sequence）と呼ばれ、
# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, と続く。
# 最初の二項は 0, 1 であり、以後どの項もその直前の2つの項の和となっている。

def fibonacci(n)
  if n <= 1
    n
  else
    fibonacci(n-2) + fibonacci(n-1)
  end
end

p fibonacci(3)

p (1..10).map { |it| fibonacci(it)}
#一つずつ出力=>each
(1..10).each { |it| puts fibonacci(it)}

#文字に重複があればNG、なければNG AAAA=>NG Paiza=>OK
#charsで文字列を一つずつ配列に。=> uniqで一意性のある要素を取得しsizeでその数を出す

word = gets.chomp

character = word.chars

if character.uniq.size > 1
    puts "OK"
else
    puts "NG"
end

#複数回、繰り返し処理
n = 5
n.times { puts "paiza"}

#標準入力　1行=>gets 複数行=>readlines

c = gets #入力した1行を返す
p c
a = readlines  #複数の入力された要素を配列にして返す control + d　で抜ける
p a

#複数行にわたる入力
while line = gets #入力された行を止まらずに返す　複数OK!
  puts line.chomp
end

#複数行の入力
# a = readlines
# p a.max.chomp

#半角スペース区切りの横並び出力　=> times と　print
n = 10
a = "paiza"
n.times { print a + " "}

#配列の置換 全ての要素=>fill() 

a = [1,2,3]

print a.fill(4)

input = $stdin.read.split(/\s/)
p input
