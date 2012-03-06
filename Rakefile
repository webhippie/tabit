require 'rubygems'

begin
  require 'bundler'
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end

require 'rake'
require 'jeweler'
require 'yard'

$:.push File.expand_path('../lib', __FILE__)
require 'tabit/version'

Jeweler::Tasks.new do |gem|
  gem.name = 'tabit'
  gem.version = Tabit::Version::STRING
  gem.homepage = 'https://github.com/Langwhich/tabit'
  gem.license = 'MIT'
  gem.summary = %Q{Tabit is a simple tab menu generator}
  gem.email = 'thomas.boerger@langwhich.com'
  gem.authors = ['Thomas Boerger', 'Tim Rudat']
end

Jeweler::RubygemsDotOrgTasks.new
YARD::Rake::YardocTask.new

task :default => :version
