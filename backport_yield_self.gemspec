$:.push File.expand_path('../lib', __FILE__)

require 'backport_yield_self/version'

Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'backport_yield_self'
  s.summary = 'backport_yield_self is the backport of Kernel#yield_self in Ruby 2.5 to older Ruby versions.'

  s.version = BackportYieldSelf::VERSION

  s.licenses = 'MIT'

  s.authors = ['Koichi ITO']
  s.email = 'koic.ito@gmail.com'
  s.homepage = 'https://github.com/koic/backport_yield_self'

  s.require_paths = ['lib']
  s.extensions = ['ext/backport_yield_self/extconf.rb']
  s.files = [
    'Manifest.txt',
    'README.md',
    'Rakefile',
    'ext/backport_yield_self/extconf.rb',
    'ext/backport_yield_self/backport_yield_self.c',
    'lib/backport_yield_self.rb'
  ]

  s.required_ruby_version = ['>= 2.2.0', '< 2.5.0']
  s.post_install_message = <<-EOS
backport_yield_self is the backport of Kernel#yield_self in Ruby 2.5 to older Ruby versions.
The best way is to use Ruby 2.5 or later.
Thanks.
  EOS

  s.add_development_dependency('hoe')
  s.add_development_dependency('rake-compiler')
  s.add_development_dependency('rspec', '>= 3.0.0')
end
