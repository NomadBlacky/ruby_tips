#! /usr/bin/env ruby
# coding: utf-8

require 'erb'

describe ERB do

  it "erb ことはじめ" do
    erb = ERB.new("number: <%= n %>")
    n = 10
    expect(erb.result(binding)).to eq "number: 10"
  end

  it "分岐" do
    erb = ERB.new(<<-EOS)
<% if n == 0 %>
  hoge
<% end %>
<% if n == 1 %>
  foo
<% end %>
    EOS
    n = 1
    expect(erb.result(binding).strip).to eq "foo"
  end

  it "繰り返し" do
    erb = ERB.new("<% (1..5).each do |i| %><%=i%><% end %>")
    expect(erb.result(binding)).to eq "12345"
  end

end
