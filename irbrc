#!/usr/bin/env ruby
require 'irb/ext/save-history'
require 'irb/completion'

IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.history/irb_history" 
IRB.conf[:AUTO_INDENT]  = true
IRB.conf[:PROMPT_MODE]  = :SIMPLE

ENV['IRB_HISTORY_FILE'] = IRB.conf[:HISTORY_FILE]

# begin 
#   require 'looksee'
#   require 'wirble'
#   Wirble.init
#   Wirble.colorize
#   Looksee.styles = {
#     :module     => "\e[2;37m%s\e[0m", 
#     :public     => "\e[2;32m%s\e[0m", 
#     :protected  => "\e[2;33m%s\e[0m", 
#     :private    => "\e[2;31m%s\e[0m", 
#     :undefined  => "\e[2;37m%s\e[0m", 
#     :overridden => "\e[2;34m%s\e[0m"
#   }
# rescue LoadError
#   "Error loading requirements. Run 'gem install wirble' and 'gem install looksee' to enable full functionality"
# end
