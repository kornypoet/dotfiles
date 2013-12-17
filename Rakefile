require 'rake'
require 'fileutils'

task default: [:install]

desc 'Install dotfiles'
task install: ['install:nicely']

desc 'Remove installed dotfiles'
task remove:  ['install:remove']

namespace :install do

  task :nicely do
    puts 'Installing dotfiles nicely...'
    Rake::Task['install:create_links'].invoke(:nicely)
  end

  desc 'Creates symlinks in your home directory for all dotfiles, overriding ones that already exist'
  task :forced do
    puts 'Forcing dotfiles install...'
    Rake::Task['install:create_links'].invoke(:forced)
  end

  task :history_dir do
    hist_dir = to_symlink 'history'
    FileUtils.mkdir hist_dir unless File.exist? hist_dir
  end

  task :emacs_dir do
    emacs_dir = File.expand_path('../emacs.d/autosaves', __FILE__)
    FileUtils.mkdir emacs_dir unless File.exist? emacs_dir
  end

  task :remove do
    puts 'Removing installed dotfiles...'
    install_files.each do |dotfile|
      manifest[dotfile] << 'checking'
      installed = to_symlink dotfile
      if File.symlink?(installed) && File.readlink(installed) == dotfile
        manifest[dotfile] << 'exists' << "removing #{installed}"
        FileUtils.rm installed
      else
        manifest[dotfile] << 'does not exist' << 'skipping'
      end
    end
    report_and_save!
  end

  task :create_links, [:level] => [:history_dir, :emacs_dir] do |t, args|
    FileUtils.remove_dir(old_dotfile_dir) if File.exist? old_dotfile_dir
    FileUtils.mkdir old_dotfile_dir
    install_files.each do |dotfile|
      File.exist?(to_symlink dotfile) ? manifest[dotfile] << 'exists' : manifest[dotfile] << 'does not exist yet'
      self.send("#{args[:level].to_s}_link".to_sym, dotfile, to_symlink(dotfile))
    end
    report_and_save!
  end

  def to_symlink dotfile
    File.join(ENV['HOME'], '.' + File.basename(dotfile))
  end

  def install_files
    Dir[File.expand_path('../*', __FILE__)].reject{ |dotfile| noninstall_files.include? File.basename(dotfile) }
  end

  def noninstall_files
    %w[ README.md MANIFEST Rakefile . .. .git zsh.d bashrc csshrc emacs-modes ]
  end
  
  def report_and_save!
    report = manifest.map{ |dotfile, reports| reports.map{ |report| File.basename(dotfile) + '...' + report } }.flatten
    File.open(File.expand_path('../MANIFEST', __FILE__), 'w'){ |f| f.puts report.join("\n") }
    puts report
  end
  
  def nicely_link(dotfile, location)
    if File.exist? location
      manifest[dotfile] << 'skipping'
    else
      manifest[dotfile] << 'creating new symlink'
      FileUtils.symlink(dotfile, location)
    end
  end

  def forced_link(dotfile, location)
    manifest[dotfile] << "moving to #{old_dotfile_dir}" << 'forcing new symlink'
    FileUtils.mv(location, old_dotfile_dir) if File.exist?(location)
    FileUtils.symlink(dotfile, location, force: true)
  end

  def manifest
    @manifest ||= Hash.new{ |hsh, key| hsh[key] = [] }
  end

  def old_dotfile_dir
    '/tmp/old-dotfiles'
  end
end
