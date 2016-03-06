#! /user/bin/env ruby
# coding: utf-8

require 'sqlite3'

describe SQLite3::Database do

  before(:each) do
    @db = SQLite3::Database.new(File.dirname(__FILE__) + "/test.sqlite")
  end

  after(:each) do
    @db.close
  end

  it "データベースを開く" do
    @db
  end

  it "レコードの取得" do
    result = @db.execute('select * from test where id = 1')
    expect(result).to eq [[1, 1, 2.2, "three"]]
  end

  it "列名とレコードの取得" do
    head, *rows =  @db.execute2('select * from test where id = 1')
    expect(head).to eq ["id", "a", "b", "c"]
    expect(rows).to eq [[1, 1, 2.2, "three"]]
  end

  it "SELECTした結果の最初のレコードを取得" do
    result = @db.get_first_row('select * from test order by id')
    expect(result).to eq [1, 1, 2.2, "three"]
  end

  it "SELECTした結果の最初のレコードの最初の値を取得する" do
    result = @db.get_first_value('select count(*) from test where id = 1')
    expect(result).to eq 1
  end

  it "トランザクション" do
    begin
      @db.transaction do
        @db.execute('insert into test values(0, 111, 2.22, "san")')
        raise "hogehoge" #ロールバックされる
      end #なにもなければここでコミット
    rescue
      result = @db.execute('select * from test where id = 0')
      expect(result).to eq []
    end
  end
  
end
