# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sensu-plugin-sidekiq-latency/version'

Gem::Specification.new do |spec|
  spec.name          = 'sensu-plugins-sidekiq-latency'
  spec.version       = SensuPluginSidekiqLatency::VERSION
  spec.authors       = ['Jason Langenauer']
  spec.email         = ['jason@chartmogul.com']

  spec.summary       = %q{Sensu Plugin to alert on Sidekiq latency of a particular queue}
  spec.description   = %q{Sensu Plugin to alert on Sidekiq latency of a particular queue}
  spec.homepage      = 'https://github.com/chartmogul/sensu-plugin-sidekiq-latency'

  spec.files         = Dir.glob('{bin,lib}/**/*') + %w(README.md)
  spec.executables   = Dir.glob('bin/**/*.rb').map { |file| File.basename(file) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'sensu-plugin', '~> 1.2'
  spec.add_dependency 'sidekiq', '>= 3.5'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
