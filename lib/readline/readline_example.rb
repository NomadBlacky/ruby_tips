#! /user/bin/env ruby
# coding: utf-8


require 'readline'

LIST = [
  'search', 'download', 'open',
  'help', 'history', 'quit',
  'url', 'next', 'clear',
  'prev', 'past',
].sort

comp = proc { |s| LIST.grep( /^#{Regexp.escape(s)}/ ) }

Readline.completion_append_character = " "
Readline.completion_proc = comp

while line = Readline.readline('> ', true).strip
  break if line == "exit"
  p line
end
