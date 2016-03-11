#! /user/bin/env ruby
# coding: utf-8

require 'yaml'

describe YAML do
  let(:yaml) { YAML.load_file(File.dirname(__FILE__) + "/test.yaml") }
  let(:root) { yaml["root"] }
  let(:test_file_path) { File.dirname(__FILE__) + "/serialize.yaml" }
  
  it "ファイルを読み込む" do
    yaml
  end

  it "ハッシュ" do
    hash = root["test_hash"]
    expect(hash["h1"]).to eq 1
    expect(hash["h2"]).to eq 2
    expect(hash["h3"]).to eq ({"h3_1" => 3, "h3_2" => 4})
  end

  it "配列" do
    ary = root["test_array"]
    expect(ary.size).to eq 3
    expect(ary[0]).to eq "a"
    expect(ary[1]).to eq "b"
    expect(ary[2]).to eq ["c", "d"]
  end

  it "boolean" do
    hash = root["test_boolean"]
    expect(hash["b1"]).to eq true
    expect(hash["b2"]).to eq false
    expect(hash["b3"]).to eq true
    expect(hash["b4"]).to eq false
    expect(hash["b5"]).to eq true
    expect(hash["b6"]).to eq false
  end

  it "整数" do
    hash = root["test_integer"]
    expect(hash["i1"]).to eq 1
    expect(hash["i2"]).to eq 123456
    expect(hash["i3"]).to eq 10
    expect(hash["i4"]).to eq 255
  end

  it "浮動小数点" do
    hash = root["test_float"]
    expect(hash["f1"]).to eq 0.05
  end
  
  it "文字列" do
    hash = root["test_string"]
    expect(hash["s1"]).to eq "hoge"
    expect(hash["s2"]).to eq "foo"
    expect(hash["s3"]).to eq "ほげほげ"
  end

  it "日付" do
    hash = root["test_date"]
    expect(hash["d1"]).to eq Date.new(2016, 2, 28)
    expect(hash["d2"]).to eq "2016/02/28"
  end

  it "タイムスタンプ" do
    hash = root["test_time_stamp"]
    expect(hash["ts1"]).to eq Time.local(2016, 2, 28, 23, 0, 0)
  end

  it "シリアライズとデシリアライズ" do
    obj1 = Hoge.new("foo", [1, 2, 3], {x: 7, y: 8, z: 9})
    File.open(test_file_path, "w+") { |f| f.write(obj1.to_yaml) }
    obj2 = YAML.load_stream(File.new(test_file_path)).first
    expect(obj1.a).to eq obj2.a
    expect(obj1.b).to eq obj2.b
    expect(obj1.c).to eq obj2.c
    expect(obj1.class).to eq obj2.class
  end
  
end

class Hoge
  attr_reader :a, :b, :c
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end
end
