#ハッシュ　要素の追加　要素の変更　取得
currencies = { "japan" => "yen", "usa" =>"USD", "Indonesia" => "Rrupia"}
currencies['Spain'] = "euro"
currencies['japan'] = "円"
puts currencies
puts currencies["Spain"]

#ハッシュ　繰り返し処理
currencies.each do |key, value|
  puts "#{key} : #{value}"
  # print "#{key} : #{value} "
end

#ブッロク引数を一つにするとkeyと値が配列に格納される
currencies.each do |n| # n => [key, value]
  key = n[0]
  value = n[1]
  puts "#{key} は #{value}"
end

#ハッシュの比較　並び順は関係なし！
currencies1 = { "japan" => "yen", "usa" =>"USD", "Indonesia" => "Rrupia"}
currencies2 = { "japan" => "yen", "usa" =>"USD", "Indonesia" => "Rrupia"}

p currencies1 == currencies2

#ハッシュの要素数
p currencies2.size
p currencies2.length

#ハッシュの削除 keyを指定して削除
p currencies.delete("japan") # =>"円"
print currencies

#シンボル(:oo)は整数扱い　=> 文字列より処理が速い *文字列ではない！！
p :apple.class #symbol 

#同じシンボルは同じオブジェクト ↓オブジェクトidが同じ 文字列はオブジェクトidが異なる
p :apple.object_id
p :apple.object_id
p :apple.object_id

p "apple".object_id
p "apple".object_id
p "apple".object_id

#シンボルはイミュータブル　破壊的な変更不可
# symbol = :apple
# p symbol.upcase! #no method error
symbol = "apple"
p symbol.upcase

currencies = { :japan => "yen", :china => "元", :korea => "won"}
# => ではなく、key: valueでもok! :の位置に注意
currencies = { japan: "yen", china: "元", korea: "won"}
p currencies[:japan]
p currencies[:korea]
p currencies

#keyもvalueもシンボルの時
currencies = { japan: :yen, korea: :won, china: :gen}
p currencies

#ハッシュ条件指定
p currencies.keys
p currencies.values
p currencies.has_key?(:italy)
p currencies.has_key?(:korea)

#ハッシュ展開　**
h = { portugal: 'Joao', uruguay: 'Luiz', spain: 'Marcos' }
puts atleti = { spain2: 'Koke', **h }
puts atleti = { spain2: 'Koke' }.merge(h)
h = { us: 'doller', india: 'rupee'}
puts y = { japan: 'yen', **h } #変数に入れてあげる！！
# puts { japan: 'yen', **h } #syntax error, unexpected ',', expecting end-of-input
# puts y

#ハッシュを配列へ=>to_a　配列をハッシュへ=>to_h
print atleti.to_a
print atleti.to_h

#ハッシュの初期値
s = {}
p s[:foo] #=>nil

#キーがなければ'Hello'を返す
s = Hash.new('Hello')
p a = s[:foo] #=>'Hello'
p b = s[:foo]
p a.equal?(b) #aとbは同一オブジェクト

#%記法でシンボルやシンボルの配列
#%s! もしくは ()で囲んでシンボルに
p %s!ruby is fun! # => :"ruby is fun"
p %s(ruby is fun) # => :"ruby is fun"

# %iを置いて配列作成　空白が区切り
p %i(apple orange melon) # => [:apple, :orange, :melon]

# 文字列とシンボルは別物
a = "apple"
b = :apple
p a == b # => false

#相互に変換可能
p a.to_sym == b # => true
p a == b.to_s # => true

# &.演算子を使えばnilじゃない場合は結果を、nilの場合はnilを返す
a = "foo"
p a&.upcase
v = nil
p v&.upcase

# <<で文字列連結
a = "aiu"
b = "eo"
p a << b # => aiueo

# n回繰り返して連結した文字列
p a * 3 # => aiuaiuaiu

# 変数がnilまたはfalseであれば〇〇を代入 ||=
limit = 200
limit ||= 10
p limit #=> 200

limit = nil
limit ||= 10 #変数limitがnilまたはfalseなら10を代入
p limit #=> 10

# trueまたはfalseに変換 !!変数　trueかfalseを返す
user = "Taro"
p !!user
user = nil
p !!user