#例外処理

puts 'Start'

module Greeter
  def hello
    puts "hello"
  end
end

begin
  #moduleはインスタンスを作成できないのでGreeter.newでエラー(例外)発生
  greeter = Greeter.new
rescue
  puts "例外が発生したが、このまま続行"
end

puts 'End'

def method_1
  puts "method1 start"
  begin
    method2
  rescue
    puts "例外発生！"
  end
  puts "method1 end"
end

def method_2
  puts "method2 start"
    method3
  puts "method2 end"
end

def method_3
  puts "method3 start"
    1 / 0
  puts "method3 end"
end

method_1

#例外オブジェクト情報取得 messageメソッド、backtraceメソッド
begin
  1 / 0
rescue => e
  puts "エラークラス: #{e.class}"
  puts "エラーメッセージ: #{e.message}"
  puts "バックトレース ---"
  puts e.backtrace
  puts "---"
end

#例外クラスを指定　一致した時だけ例外を捕捉する
begin
  1 / 0
rescue ZeroDivisionError
  puts "0で徐算しました"
end
#=> "0で徐算しました"

#例外クラスが一致しないと異常終了
# begin
#   "abc".foo
# rescue ZeroDivisionError
#   puts "0で徐算しました"
# end
# #=> undefined method `foo' for "abc":String (NoMethodError)

#複数の例外クラスを指定
begin
  "abc".foo
rescue ZeroDivisionError
  puts "0で徐算しました"
rescue NoMethodError
  puts "存在しないメソッドが呼び出されました"
end
#=>"存在しないメソッドが呼び出されました"

begin
  "abc".foo
rescue ZeroDivisionError, NoMethodError
  puts "0で徐算したか、存在しないメソッドが呼び出されました"
end
#=>"0で徐算したが、存在しないメソッドが呼び出されました"

#例外オブジェクトを変数に格納も可能
begin
  "abc".foo
rescue ZeroDivisionError, NoMethodError => e
  puts "0で徐算したか、存在しないメソッドが呼び出されました"
  puts "エラー: #{e.class} #{e.message}"
end
#=> 0で徐算したか、存在しないメソッドが呼び出されました
#=> エラー: NoMethodError undefined method `foo' for "abc":String