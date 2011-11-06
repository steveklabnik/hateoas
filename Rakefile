require "bundler/gem_tasks"
require 'rake/clean'

task :default => :spec

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ["--color"]
end

# Bring in Rocco tasks
require 'rocco/tasks'
Rocco::make 'docs/'

desc 'Build rocco docs'
task :docs => :rocco
directory 'docs/'

file 'docs/index.html' => 'docs/lib/hateoas.html' do |f|
  cp 'docs/lib/hateoas.html', 'docs/index.html', :preserve => true
end
task :docs => 'docs/index.html'
CLEAN.include 'docs/index.html'

# Alias for docs task
task :doc => :docs

# GITHUB PAGES ===============================================================

desc 'Update gh-pages branch'
task :pages => ['docs/.git', :docs] do
  rev = `git rev-parse --short HEAD`.strip
  Dir.chdir 'docs' do
    sh "git add *.html"
    sh "git commit -m 'rebuild pages from #{rev}'" do |ok,res|
      if ok
        verbose { puts "gh-pages updated" }
        sh "git push -q o HEAD:gh-pages"
      end
    end
  end
end

# Update the pages/ directory clone
file 'docs/.git' => ['docs/', '.git/refs/heads/gh-pages'] do |f|
  sh "cd docs && git init -q && git remote add o ../.git" if !File.exist?(f.name)
  sh "cd docs && git fetch -q o && git reset -q --hard o/gh-pages && touch ."
end
CLOBBER.include 'docs/.git'

