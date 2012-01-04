require 'rubygems'
require 'rake'
require 'fileutils'

task :default => [:create_links]

task :create_links do
  Dir[File.join(File.dirname(__FILE__), '*')].each do |f|
    link_file f unless noninstall_files.include? File.basename(f)
  end
end

def link_file f
  symlink = File.join(ENV["HOME"], '.' + File.basename(f))
  FileUtils.ln_s(f, symlink) unless File.exist? symlink
end

def noninstall_files
  [ 'README.md', 'Rakefile', '.', '..', '.git' ] 
end
