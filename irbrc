#!/usr/bin/env ruby
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.history/irb_history" 
IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:PROMPT_MODE]  = :SIMPLE

begin 
  require 'looksee'
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError
  "Error loading requirements. Run 'gem install wirble' and 'gem install looksee' to enable full functionality"
end
