require 'rake'
require 'fileutils'

task :default => ["install:nicely"]

namespace :install do

  desc "Creates symlinks in your home directory for all dotfiles, skipping ones that already exist"
  task :nicely do
    puts "Installing dotfiles nicely..."
    Rake::Task["install:create_links"].invoke(:nicely)
  end

  desc "Creates symlinks in your home directory for all dotfiles, overriding ones that already exist"
  task :forced do
    puts "Forcing dotfiles install.."
    Rake::Task["install:create_links"].invoke(:forced)
  end

  desc "Creates a directory for saving shell history"
  task :make_history_dir do
    hist_dir = File.join(ENV['HOME'], '.history')
    FileUtils.mkdir hist_dir unless File.exist? hist_dir
  end

  task :create_links, [ :level ] => :make_history_dir do |t,args|
    FileUtils.remove_dir("/tmp/old-dotfiles") if File.exists? "/tmp/old-dotfiles"
    FileUtils.mkdir("/tmp/old-dotfiles")
    Dir[File.join(File.dirname(__FILE__), '*')].each do |f|
      next if noninstall_files.include? File.basename(f)					
      manifest[f] = []
      symlink = File.join(ENV["HOME"], '.' + File.basename(f))  
      File.exist?(symlink) ? manifest[f] << "exists" : manifest[f] << "does not exist yet"
      self.send("#{args[:level].to_s}_link".to_sym, f, symlink)
    end
    report_and_save!
  end

  def noninstall_files
    [ 'README.md', 'MANIFEST', 'Rakefile', '.', '..', '.git', 'zsh.d' ] 
  end
  
  def report_and_save!
    report = manifest.map{ |f,reports| reports.map{ |report| File.basename(f) + '...' + report } }.flatten
    File.open(File.join(File.dirname(__FILE__), 'MANIFEST'), 'w') { |f| f.puts report.join("\n") }
    puts report
  end
  
  def nicely_link f, link
    if File.exists? link
      manifest[f] << "skipping"
    else
      manifest[f] << "creating new symlink"
      FileUtils.symlink(f, link) 
    end
  end
  
  def forced_link f, link
    manifest[f] << "moving to /tmp/old-dotfiles" << "forcing new symlink"
    FileUtils.mv(link, "/tmp/old-dotfiles")
    FileUtils.symlink(f, link, :force => true)
  end
  
  def manifest
    @manifest ||= {}
  end

end
