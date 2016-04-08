#! /user/bin/env ruby
# coding: utf-8

# 時刻と文字列の変換が必要な場合はrequireする。
require "time"

describe Time do

  example "new/now : 現在時刻のTimeオブジェクトを生成する。" do
    Time.new
    Time.now
  end

  example "local/mktime : 指定時刻のTimeオブジェクトを生成する。" do
    t1 = Time.local(2016, 1, 2, 3, 40, 50)
    t2 = Time.mktime(2016, 1, 2, 3, 40, 50)
    expect(t1).to eq t2
  end

  example "gm/utc : 指定時刻の協定世界時を取得する。" do
    t1 = Time.gm(2016, 1, 2, 3, 40, 50)
    t2 = Time.utc(2016, 1, 2, 3, 40, 50)
    expect(t1).to eq t2
  end

  example "at : 1970/1/1 00:00:00 UTC からの経過秒数で取得する。" do
    t1 = Time.now
    t2 = Time.at(t1)
    expect(t1).to eq t2

    t3 = Time.at(0)
    t4 = Time.utc(1970, 1, 1)
    expect(t3).to eq t4
  end

  example "parse : 文字列からTimeオブジェクトを生成する。" do
    t1 = Time.parse("2016-01-01 00:00:00")
    t2 = Time.local(2016)
    expect(t1).to eq t2
  end

  example "strftime : 時刻を指定フォーマットで文字列に変換する。" do
    # 参考 : http://docs.ruby-lang.org/ja/2.1.0/method/Time/i/strftime.html
    t1 = Time.local(2016, 1, 2, 3, 40, 50)
    str_time = t1.strftime("%Y-%m-%d %H:%M:%S")
    expect(str_time).to eq "2016-01-02 03:40:50"
  end

  example "utc/gmtime : 協定世界時に変換(破壊的)" do
    t1 = Time.local(2016, 1, 1, 9, 0, 0).utc
    t2 = Time.utc(2016, 1, 1)
    expect(t1).to eq t2
  end
  
  example "localtime : ローカルのタイムゾーンに変換(破壊的)" do
    t1 = Time.local(2016, 1, 1, 9, 0, 0)
    t2 = Time.utc(2016, 1, 1).localtime
    expect(t1).to eq t2
  end

  example "+ : 時刻の加算" do
    t1 = Time.local(2016, 1, 1, 1, 1, 0) + 1
    t2 = Time.local(2016, 1, 1, 1, 1, 1)
    expect(t1).to eq t2

    t3 = Time.local(2016, 1, 1, 0, 0, 0) + (4*60*60*24) # 4日
    t4 = Time.local(2016, 1, 5, 0, 0, 0)
    expect(t3).to eq t4
  end

  example "- : 時刻の減算" do
    t1 = Time.local(2016, 1, 1, 1, 1, 0)
    t2 = Time.local(2016, 1, 1, 1, 1, 1) - 1
    expect(t1).to eq t2

    t3 = Time.local(2016, 1, 1, 0, 0, 0)
    t4 = Time.local(2016, 1, 5, 0, 0, 0) - (4*60*60*24) # 4日
    expect(t3).to eq t4
  end

  example "- : 2つの時刻の差を求める" do
    t1 = Time.local(2016, 1, 1, 0, 0, 0)
    t2 = Time.local(2016, 1, 2, 0, 0, 0)
    expect(1*60*60*24).to eq t2 - t1    
  end
  
end
