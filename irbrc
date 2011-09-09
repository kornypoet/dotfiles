#!/usr/bin/env ruby

%w[ looksee wirble ].each do |gem|
  begin ; require gem ; rescue LoadError ; end
end

begin 
  require 'looksee'
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError
  "Error loading requirements. Run 'gem install wirble' and 'gem install looksee' to enable full functionality"
end

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:PROMPT_MODE] = :SIMPLE
