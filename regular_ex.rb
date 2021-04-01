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



