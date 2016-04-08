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

  example "compact : nil以外の要素を返す" do
    array = [1, nil, 2, 3, nil].compact
    expect(array).to eq [1, 2, 3]
  end

  example "any? : 1つでも条件に合う要素があればtrueを返す" do
    array1 = ["a", "bb", "c"].any?{ |str| 2 <= str.length }
    expect(array1).to be_truthy

    array2 = [1, 2, 3].any?(&:nil?)
    expect(array2).to be_falsey
  end

  example "all? : 全ての要素が条件に合っていればtrueを返す" do
    array1 = ["a", "bb", "c"].all?{ |str| 2 <= str.length }
    expect(array1).to be_falsey

    array2 = [nil, nil, nil].all?(&:nil?)
    expect(array2).to be_truthy
  end

  example "empty? : 1件も無ければtrueを返す" do
    expect([].empty?).to be_truthy
    expect(["hoge"].empty?).to be_falsey
  end

  example "first : 最初の要素を返す" do
    expect([1, 2, 3].first).to eq 1
  end

  example "last : 最後の要素を返す" do
    expect([1, 2, 3].last).to eq 3
  end

  example "sample : 任意の要素を返す" do
    array = [1, 2, 3, 4, 5]
    expect(array).to include array.sample
  end

  example "with_index : インデックス付きでループ処理のメソッドを実行する" do
    array = [0, 1, 2, 3]
    array.each.with_index do |num, index|
      expect(num).to eq index
    end

    a = array.map.with_index do |num, index|
      num * index
    end
    expect(a).to eq [0, 1, 4, 9]
  end

  example "join : 配列を1つの文字列として返す" do
    expect(["a", "b", "c"].join('-')).to eq 'a-b-c'
  end

  example "max/max_by : 最大の要素を返す" do
    hexes = [-3, -2, -1]
    expect(hexes.max).to eq -1
    expect(hexes.max_by(&:abs)).to eq -3
  end
  
  example "min/min_by : 最小の要素を返す" do
    hexes = [-3, -2, -1]
    expect(hexes.min).to eq -3
    expect(hexes.min_by(&:abs)).to eq -1
  end
  
  
end
