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