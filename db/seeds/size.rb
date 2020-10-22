# sizeの初期データの投入
# 親レコード作成
parent1 = Size.create(name: 'レディース服,メンズ服')
parent2 = Size.create(name: 'レディース靴')
parent3 = Size.create(name: 'メンズ靴')
parent4 = Size.create(name: '子供服~95cm')
parent5 = Size.create(name: '子供服100~')
parent6 = Size.create(name: '子供靴')
parent7 = Size.create(name: 'タイヤ')
parent8 = Size.create(name: 'ヘルメット')
parent9 = Size.create(name: 'スノーボード板')
parent10 = Size.create(name: 'スキー板')
parent11 = Size.create(name: 'カメラレンズ')
parent12 = Size.create(name: 'テレビ')

# メンズ、レディース服
size1_child_ary = ["XXS以下","XS(SS)","S","M","L","XL(LL)","2XL(3L)","3XL(4L)","4XL(5L)以上","FREE SIZE"]
size1_child_ary.each do |child|
  parent1.children.create(name: child)
end

#レディース靴
size2_child_ary = ["20cm以下","20cm以下","20.5cm","21cm","21.5cm","22cm","22.5cm","23cm","23.5cm","24cm","24.5cm","25cm","25.5cm","26cm","26.5cm","27cm","27.5cm以上"]
size2_child_ary.each do |child|
  parent2.children.create(name: child)
end

#メンズ靴
size3_child_ary = ["23.5cm以下","24cm","24.5cm","25cm","25.5cm","26cm","26.5cm","27cm","27.5cm","28cm","28.5cm","29cm","29.5cm","30cm","30.5cm","31cm以上"]
size3_child_ary.each do |child|
  parent3.children.create(name: child)
end

#子供服~95cm
size4_child_ary = ["60cm","70cm","80cm","90cm","95cm"]
size4_child_ary.each do |child|
  parent4.children.create(name: child)
end

#子供服100~
size5_child_ary = ["100cm","110cm","120cm","130cm","140cm","150cm","160cm"]
size5_child_ary.each do |child|
  parent5.children.create(name: child)
end

#子供靴
size6_child_ary = ["10.5cm以下","11cm・11.5cm","12cm・12.5cm","13cm・13.5cm","14cm・14.5cm","15cm・15.5cm","16cm・16.5cm","17cm以上"]
size6_child_ary.each do |child|
  parent6.children.create(name: child)
end

#タイヤ
size7_child_ary = ["12インチ","13インチ","14インチ","15インチ","16インチ","17インチ","18インチ","19インチ","20インチ","21インチ","22インチ","23インチ","24インチ"]
size7_child_ary.each do |child|
  parent7.children.create(name: child)
end

#ヘルメット
size8_child_ary = ["XSサイズ以下","Sサイズ","Mサイズ","Lサイズ","XLサイズ","XXLサイズ以上","フリーサイズ","子ども用"]
size8_child_ary.each do |child|
  parent8.children.create(name: child)
end

#スノーボード板
size9_child_ary = ["135cm-140cm未満","140cm-145cm未満","145cm-150cm未満","150cm-155cm未満","155cm-160cm未満","160cm-165cm未満","165cm-170cm未満"]
size9_child_ary.each do |child|
  parent9.children.create(name: child)
end

#スキー板
size10_child_ary = ["140cm~","150cm~","160cm~","170cm~","スキーボード","子供用","その他"]
size10_child_ary.each do |child|
  parent10.children.create(name: child)
end

#カメラレンズ
size11_child_ary = ["ニコンFマウント","キヤノンEFマウント","ペンタックスKマウント","ペンタックスQマウント","フォーサーズマウント","マイクロフォーサーズマウント","α Aマウント","α Eマウント","ニコン1マウント","キヤノンEF-Mマウント","Xマウント","シグマSAマウント"]
size11_child_ary.each do |child|
  parent11.children.create(name: child)
end

#テレビ
size12_child_ary = ["～20インチ","20～26インチ","26～32インチ","32～37インチ","37～40インチ","40～42インチ","42～46インチ","46～52インチ","52～60インチ","60インチ～"]
size12_child_ary.each do |child|
  parent12.children.create(name: child)
end