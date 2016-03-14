#! /user/bin/env ruby
# coding: utf-8

describe Array do

  let(:int_array) { (-5..5).to_a }
  let(:str_array) { ('a'..'zz').to_a }

  example "find : 最初に見つかったものを返す" do
    num = int_array.find(&:zero?)
    expect(num).to eq 0
  end

  example "select : 条件に合うものを全て返す" do
    str_z = str_array.select{ |s| s.match(/^z+$/) }
    expect(str_z).to eq ['z', 'zz']
  end

  example "count : 条件に合う要素の数を返す"

  example "map : ある配列から別の配列を作る"

  example "flat_map : mapの結果をネストしないフラットな配列として受け取る"

  example "compact : nil以外の要素を返す"

  example "any? : 1つでも条件に合う要素があればtrueを返す"

  example "all? : 全ての要素が条件に合っていればtrueを返す"

  example "empty? : 1件も無ければtrueを返す"

  example "first : 最初の要素を返す"

  example "last : 最後の要素を返す"

  example "sample : 任意の要素を返す"

  example "wexampleh_index : インデックス付きでループ処理のメソッドを実行する"

  example "join : 配列を1つの文字列として返す"

  example "max/max_by : 最大の要素を返す"
  
  example "max/max_by : 最大の要素を返す"
  
  example "min/min_by : 最小の要素を返す"

  
  
end
