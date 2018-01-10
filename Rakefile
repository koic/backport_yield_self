require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'hoe'
gem 'rake-compiler'
require 'rake/extensiontask'

name = 'backport_yield_self'

Hoe.plugin :gemspec

HOE = Hoe.spec name do
  VERSION = BackportYieldSelf::VERSION
  developer('Koichi ITO', 'koic.ito@gmail.com')
  license 'MIT'
end

RET = Rake::ExtensionTask.new(name, HOE.spec) do |ext|
  ext.lib_dir = File.join('lib', name)
end
