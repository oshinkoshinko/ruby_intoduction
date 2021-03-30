p "ruby"[0,3] #1番目から3文字　rub
p "ruby".slice(0,3) #rub
p "ruby".slice(0..1)


#標準入出力
#times do で指定された回数分処理を実行
# gets.to_i.times do
#   employee = gets.split(" ")
#   employee[1] = employee[1].to_i + 1 #配列の要素を変更してあげる！
#   puts employee.join(" ")
# end

#しりとり　aの最後の文字とbの最初の文字が一致且つ、bの最後の文字が"n"以外=>OK
# a = gets.chomp.chars
# b = gets.chomp.chars
a = ["p", "a", "i", "z", "a"]
b = ["a", "n", "a", "n"]

if a[-1] == b[0] && b[-1] != "n"
    puts "OK"
else
    puts "NG"
end

#お花見　
# a = gets.chomp.split
# b = gets.chomp.split

# first = a[2].to_f / (a[0].to_f * a[1].to_f)
# second = b[2].to_f / (b[0].to_f * b[1].to_f)

# if first.round == second.round
#     puts "DRAW"
# elsif first.round > second.round
#     puts b.join(" ")
# else
#     puts a.join(" ")
# end

#エレベーター
#入力データを、配列として取得する
# input_lines = readlines.map &:to_i

# #現状の階数と、距離の初期設定
# floor_now = 1
# distance = 0


# input_lines.each do |a|
#     #距離の絶対値で計算をする
#     if (a - floor_now) >0
#         distance += a - floor_now
#     else
#         distance -= a - floor_now
#     end
#     #距離計算後に、階数を更新する
#     floor_now = a
# end

# puts distance

#n回分処理する

n = gets.to_i

n.times do
  puts "Paiza"
end

a = "Z"
b = "Kirishima"

if b.include?(a)
  puts "YES"
else
  puts "NO"
end

#charsで1文字ずつの配列へ
numbers = "12345"
print numbers.chars

#0埋め format("%03d", 変数)
a = 23
puts format("%08d", a) #=> 00000023

b = 03
puts b

#配列を分割 each_slice()

array = (0..10).to_a
p array.each_slice(3).to_a#=>[[0, 1, 2], [3, 4, 5], [6, 7, 8], [9, 10]]

#時刻 splitで区切り
watch = "12:20"
p watch.split(":") #=>["12", "20"]
p watch.split("1") #=>["", "2:20"]
p watch.split("2") #=>["1", ":", "0"]

#0埋め削除 文字列.delete_prefix("削除したい文字")
watch = "02:04".split(":")
puts watch[0].delete_prefix("0")

# time = gets.chomp.split(":")
time = "08:20".split(":")

if time.join.chars.include?("0")
    time[0] = time[0].delete_prefix("0")
    time[1] = time[1].delete_prefix("0")  
    puts time #=>"8" "20"
else
    puts time
end

#時刻に30分足す

# time = gets.chomp.split(":").map(&:to_i)
time = [ 1, 27]

if (time[1] = time[1] + 30) > 59
    time[0] = format("%02d", time[0] + 1) #formatで0埋め
    time[1] = format("%02d", time[1] - 60)
    puts time.join(":")
else
    time[0] = format("%02d", time[0])
    time[1] = format("%02d", time[1])
    puts time.join(":")
end

#該当要素ごとに削除 delete_if
# name = gets.chomp.chars
name = "Paiza".chars
target = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]

name.delete_if do |str|
    target.include?(str)
end

puts name.join("") #=>Pz

#複数要素を置換
# name = gets.chomp
name = "PAIZA"
puts name.gsub(/A|E|G|I|O|S|Z/, "A" => "4", "E" => "3", "G" => "6", "I" => "1", "O" => "0", "S" => "5", "Z" => "2")
#=>P4124

#黒電話
# number1 = gets.chomp.split("-").join.chars

# sum = 0
# number1.each do |n|
#     n2 = n.gsub(/0|1|2|3|4|5|6|7|8|9/, "0"=>"12", "1"=>3, "2"=>4, "3"=>5, "4"=>6, "5"=>7, "6"=>8, "7"=>9, "8"=>10, "9"=>11)
#     sum += (n2.to_i * 2)
#     sum
# end

# p sum

#くじ
# atari = gets.chomp.split
# n = gets.to_i

# n.times do
#     kuji = gets.chomp.split
#     sum = 0
#     kuji.each do |k|
#         if atari.include?(k)
#             sum += 1
#         end
#     end
#     puts sum
# end

#多重ループ
# n = gets.to_i
n = 5
array = Array.new

n.times do
   str = "d"
   array << str
end

# m = gets.to_i
m = 3

m.times do
    # word = gets.chomp
    word = "dog"
    array.each do |a|
        if word.include?(a)
            puts "YES"
        else
            puts "NO"
        end
    end
end

#べき乗　累乗
p 2**2 #=>4
p 3**3 #=>27

#配列　組み合わせ 順序　重複有無　combination repeated_combination permutation repeated_permutation...

array = [1,2,4]
#組み合わせ(順序なし、重複許さない)
p array.combination(2).to_a #=> [[1, 2], [1, 4], [2, 4]]
#組み合わせ(順序なし、重複許す)
p array.repeated_combination(2).to_a #=> [[1, 1], [1, 2], [1, 4], [2, 2], [2, 4], [4, 4]]
#組み合わせ(順序あり、重複許さない)
p array.permutation(2).to_a #=> [[1, 2], [1, 4], [2, 1], [2, 4], [4, 1], [4, 2]]
#組み合わせ(順序あり、重複許す)
p array.repeated_permutation(2).to_a #=> [[1, 1], [1, 2], [1, 4], [2, 1], [2, 2], [2, 4], [4, 1], [4, 2], [4, 4]]

p ["3", "8"].include?("2")

# ・末尾が s, sh, ch, o, x のいずれかである英単語の末尾に es を付ける
# ・末尾が f, fe のいずれかである英単語の末尾の f, fe を除き、末尾に ves を付ける
# ・末尾の1文字が y で、末尾から2文字目が a, i, u, e, o のいずれでもない英単語の末尾の y を除き、末尾に ies を付ける
# ・上のいずれの条件にも当てはまらない英単語の末尾には s を付ける

p "leaf"[2]
p "leaf".delete("f")
# p "leaf".pluralize

array = [1,2,3,4,5,6,7]
p array[0..10]

#配列同士の同じ位置の要素を掛け合わせる
point =[1,2,3,4,5]
number =[2,4,6,8,10]
hiragana = ["あ", "い", "う", "え", "お"]
#zipでindex順に一個ずつ取り出してブロックの処理
p number.zip(point).map{|n,p| n*p}
p number.zip(point).map{|n,p| n*p}.sum #sumメソッドは配列の合計
p number.zip(hiragana)
p number.zip(hiragana, point)

# rule = gets.chomp.split.map(&:to_i)
# dishes = rule[0]
# members = rule[1]

# calories = Array.new

# dishes.times do
#     calory = gets.to_i
#     calories << calory
# end

# members.times do
#     student = gets.chomp.split.map(&:to_i)
#     p student.zip(calories).map{|n,p| n*p/100}.sum
# end

#配列　末尾から削除 pop

array = [1,2,3,4,5]
p array.pop #=> 5
p array #=> [1,2,3,4]