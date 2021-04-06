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