p "ruby"[0,3] #1番目から3文字　rub
p "ruby".slice(0,3) #rub
p "ruby".slice(0..1)


#標準入出力
#times do で指定された回数分処理を実行
gets.to_i.times do
  employee = gets.split(" ")
  employee[1] = employee[1].to_i + 1 #配列の要素を変更してあげる！
  puts employee.join(" ")
end

