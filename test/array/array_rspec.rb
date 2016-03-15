#! /user/bin/env ruby
# coding: utf-8

describe Array do

  example "find : 最初に見つかったものを返す" do
    num = [0, 1, 2].find(&:zero?)
    expect(num).to eq 0
  end

  example "select : 条件に合うものを全て返す" do
    array = ['a','b','c','x','y','z',].select{ |s| s.match(/^x|y|z$/) }
    expect(array).to eq ['x', 'y', 'z']
  end

  example "count : 条件に合う要素の数を返す" do
    count = [-1, 0, 1].count(&:zero?)
    expect(count).to eq 1
  end

  example "map : ある配列から別の配列を作る" do
    upcases = ['a', 'b', 'c'].map(&:upcase)
    expect(upcases).to eq ['A', 'B', 'C']
  end

  example "flat_map : mapの結果をネストしないフラットな配列として受け取る" do
    array = [1, 2, 3].flat_map{ |num| [num, num * 10] }
    expect(array).to eq [1, 10, 2, 20, 3, 30]
  end

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
