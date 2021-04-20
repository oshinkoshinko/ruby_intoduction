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

#例外クラスの継承関係 Exception > StandardError > NameError > NoMethodError
begin
  1 / 0
rescue NoMethodError
  puts "NoMethodErrorです"
rescue NameError
  puts "NameErrorです"
rescue
  puts "その他のエラーです"
end
#=> "その他のエラーです"

#例外発生時に再度処理をするretry
retry_count = 0
begin
  puts "処理を開始します"
  1 / 0
rescue
  retry_count += 1
  if retry_count <= 3
    puts "retryします。 #{retry_count}回目"
    retry
  else
    puts "retryに失敗しました"
  end
end

#意図的に例外を発生させる raise
def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  else
    raise "無効な国です。#{country}"
  end
end

p currency_of(:japan) #=> "yen"
# p currency_of(:italy) #=>`currency_of': 無効な国です。italy (RuntimeError)

# RuntimeError以外の例外クラスを指定
def currency2_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  else
    raise ArgumentError, "無効な国です。#{country}"
  end
end

# p currency2_of(:italy) #=> in `currency2_of': 無効な国です。italy (ArgumentError)

#例外処理の範囲を絞る 安易にrescueは使わない！
require 'date'

def convert_heisei_to_date(heisei_text)
  m = heisei_text.match(/平成(?<jp_year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
  year = m[:jp_year].to_i + 1988
  month = m[:month].to_i
  day = m[:day].to_i
  begin
    Date.new(year,month,day)
  rescue ArgumentError
    nil
  end
end

p convert_heisei_to_date('平成6年4月4日') #=> <Date: 1994-04-04 ((2449447j,0s,0n),+0s,2299161j)>
p convert_heisei_to_date('平成10年40月444日') #=>nil