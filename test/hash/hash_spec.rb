#! /user/bin/env ruby
# coding: utf-8

describe Hash do

  let(:hash) { {key1: "value1", key2: "value2"} }

  example "[] : 値を取り出す" do
    expect(hash[:key1]).to eq "value1"
  end

  example "[]= : 値を設定する" do
    hash[:key3] = "value3"
    expect(hash[:key3]).to eq "value3"
  end

  example "has_key? : キーが含まれるか" do
    expect(hash.has_key?(:key1)).to be_truthy
    expect(hash.has_key?(:missing_key)).to be_falsey
  end

  example "has_value? : 値が含まれるか" do
    expect(hash.has_value?("value1")).to be_truthy
    expect(hash.has_value?("missing_value")).to be_falsey
  end

  example "new(value) / Hash#default : デフォルト値を設定する" do
    h = Hash.new("missing")
    expect(h.default).to eq "missing"
    expect(h[:missing_key]).to eq "missing"
  end

  example "new(&block) : デフォルト値としてブロックを設定する" do
    h = Hash.new do |slf, key|
      slf[key] = "hoge"
    end

    expect(h[:missing_key]).to eq "hoge"
    expect(h.has_key?(:missing_key)).to be_truthy
  end

  example "デフォルト値を利用してvalueを追加・更新する" do
    h = Hash.new do |slf, key|
      slf[key] = []
    end
    expect(h[:key1]).to eq []
    expect(h[:key1] << 1).to eq [1]
    expect(h[:key1] << 2).to eq [1, 2]
    expect(h[:key2] << 3).to eq [3]
  end

  example "Fetch : キーに対する値を取得する。キーが見つからなければ指定された値を返す。" do
    v = hash.fetch(:missing_key, "hoge")
    expect(v).to eq "hoge"
  end

  example "select : ブロックが真を返すキーと値を集める" do
    hs = {a: 10, b: 20, c: 30}.select {|k,v| 20 <= v }
    expect(hs).to eq ({b: 20, c: 30})
  end

  example "reject : ブロックが偽を返すキーと値を集める" do
    hs = {a: 10, b: 20, c: 30}.reject {|k,v| 20 <= v }
    expect(hs).to eq ({a: 10})
  end

  example "invert : キーと値を入れ替える" do
    expect(hash.invert).to eq ({"value1" => :key1, "value2" => :key2})
  end

  example "merge : 2つのハッシュを統合する" do
    hs = hash.merge({key3: "value3"})
    expect(hs).to eq ({key1: "value1", key2: "value2", key3: "value3"})
  end
  
end
