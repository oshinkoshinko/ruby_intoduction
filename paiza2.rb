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
a = gets.chomp.split
b = gets.chomp.split

first = a[2].to_f / (a[0].to_f * a[1].to_f)
second = b[2].to_f / (b[0].to_f * b[1].to_f)

if first.round == second.round
    puts "DRAW"
elsif first.round > second.round
    puts b.join(" ")
else
    puts a.join(" ")
end

#エレベーター
#入力データを、配列として取得する
input_lines = readlines.map &:to_i

#現状の階数と、距離の初期設定
floor_now = 1
distance = 0


input_lines.each do |a|
    #距離の絶対値で計算をする
    if (a - floor_now) >0
        distance += a - floor_now
    else
        distance -= a - floor_now
    end
    #距離計算後に、階数を更新する
    floor_now = a
end

puts distance

#n回分処理する