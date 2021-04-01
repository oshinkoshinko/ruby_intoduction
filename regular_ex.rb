#正規表現 https://qiita.com/jnchito/items/893c887fbf19e17d3ff9
#識別子で長文を変数に格納 \dは半角数字
text = <<-TEXT
名前：伊藤淳一
電話：03-1234-5678
住所：兵庫県西脇市板波町1-2-3
TEXT

#//で正規表現を囲む scan ある文字列を検索して配列で返したい　正規表現に多い
p text
p text.scan /\d\d\-\d\d\d\d-\d\d\d\d/
p text.scan /\d-\d-\d/

#検索対象文字列のパターンが複数　->{n,m} 直前の文字がn個以上、m個以下 量指定子
#\d{1,5} 半角数字が1個~5個
text = <<-TEXT
名前：伊藤淳一
電話：03-1234-5678
電話：090-1234-5678
電話：0795-12-3456
電話：04992-1-2345
住所：兵庫県西脇市板波町1-2-3
TEXT
p text
p text.scan /\d{2,5}-\d{1,4}-\d{4}/ #["03-1234-5678", "090-1234-5678", "0795-12-3456", "04992-1-2345"]

#区切り文字が複数パターン ->[AB]AまたはB ex) [-(][-)]
text = <<-TEXT
名前：伊藤淳一
電話：03(1234)5678
電話：090-1234-5678
電話：999-9999-9999
電話：0795(12)3456
電話：04992-1-2345
住所：兵庫県西脇市板波町1-2-3
TEXT

p text
p text.scan /\d{2,5}[-(]\d{1,4}[-)]\d{4}/ #["03(1234)5678", "090-1234-5678", "0795(12)3456", "04992-1-2345"]
#最初の数字を指定もできる 1文字目は0,2文字目は0以外の半角数字
p text.scan /0[1-9]\d{0,3}[-(]\d{1,4}[-)]\d{4}/ #1-9 "-"が間にある場合は範囲指定になる！　"または"ではない！

p "-------------------------------------"
#文字列の正規表現

text = <<-TEXT
クープバゲットのパンは美味しかった。
今日はクープ バゲットさんに行きました。
クープ　バゲットのパンは最高。
ジャムおじさんのパン、ジャムが入ってた。
また行きたいです。クープ・バゲット。
クープ・バケットのパン、売り切れだった（><）
TEXT

#半角スペースまたは全角スペースまたは・　[ABC]
# p text.scan /クープ[ 　・]バゲット/　#["クープ バゲット", "クープ　バゲット", "クープ・バゲット"]

#区切り文字が無しを許容→量指定子?を使用
p text.scan /クープ[ 　・]?バ[ゲケ]ット/ #["クープバゲット", "クープ バゲット", "クープ　バゲット", "クープ・バゲット", "クープ・バケット"]

#"."で任意の1文字を表現　上と同じ結果になる
p text.scan /クープ.?バ[ゲケ]ット/ #["クープバゲット", "クープ バゲット", "クープ　バゲット", "クープ・バゲット", "クープ・バケット"]

#grepメソッド 配列の各要素に対して引数の中のオブジェクトと各要素を調べてtrueである要素を配列として返す
#split(/\n/)で改行ごとに配列へ
p text.split(/\n/).grep(/クープ.?バ[ゲケ]ット/)

p "------------------------------"
#正規表現　置換

text = <<-TEXT
<select name="game_console">
<option value="wii_u">Wii U</option>
<option value="ps4">プレステ4</option>
<option value="gb">ゲームボーイ</option>
</select>
TEXT

#value=""を抜き出す メタ文字"+"は直前の文字やパターンが1回以上連続する
p text.scan /value="[a-z0-9_]+"/ #=>["value=\"wii_u\"", "value=\"ps4\"", "value=\"gb\""]
#　><の間に何かしらの文字が続く
p text.scan />.+</ #=>[">Wii U<", ">プレステ4<", ">ゲームボーイ<"]

p text.scan /<option value="[a-z0-9_]+">(.+)<\/option>/

#\w -> 英単語1文字を表すメタ文字
p text.scan /\w/

# * は「直前の文字が0個以上」を表す
# [^AB] は「AでもなくBでもない任意の1文字」を表す

"---------------------------------"
# 空白文字
# text = <<-TEXT
# def hello(name)
#   puts "Hello, #{name}!"
# end

# hello('Alice')
          
# hello('Bob')
	
# hello('Carol')
# TEXT

# ˆ =>行頭を表すメタ文字　$ =>行末を表すメタ文字
# p text.scan /ˆ +/ #行頭から半角スペースが1文字以上続く
# p text.scan /ˆ +$/ #行頭から行末まで半角スペースが1文字以上続く
# # \t =>タブ文字を表すメタ文字 \s =>空白文字全般を表す
# p text.scan /ˆ[ \t]+$/
# p text.gsub(/ˆ[ \t]+$/, '')

#正規表現と文字列の比較　=> 一致　"=~"　不一致　"!~"　

p '123-4567' =~ /\d{3}-\d{4}/ #=>(文字列の一部または全部が一致)true なら0を返す

a = "Hello"

if a =~ /\d{1-3}-\d{4}/
  puts "Match"
else
  puts "Unmatch"
end

text = "私の誕生日は1994年4月4日です"

#()でキャプチャ　キャプチャした要素ごとに配列に
p text.scan /\d+年\d月+\d日/ # =>["1994年4月4日"]
p text.scan /(\d+)年(\d+)月(\d+)日/ # =>["1994","4","4"]
# matchメソッド　文字列が正規表現にマッチするとMatchDataオブジェクトが返る
p m = /(\d+)年(\d+)月(\d+)日/.match(text) #<MatchData "1994年4月4日" 1:"1994" 2:"4" 3:"4">
p m[1] # =>"1994"
p m[-1] # =>"4"
p m[0] # =>"1994年4月4日" [0]は全体

#キャプチャの結果にシンボルを付ける ?<symbol> => [:symbol]で取得できる！
p text.scan /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/
p m = /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/.match(text)
p m[:year] # =>"1994"
p m[1] # =>"1994" 連番でも取得可能

#キャプチャで付けたシンボルをローカル変数に！！ 左辺に正規表現！！
/(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/ =~ text
puts year # =>1994
