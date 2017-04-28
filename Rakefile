require "bundler/gem_tasks"
require "rspec/core/rake_task"

desc 'Generate API documentation'
YARD::Rake::YardocTask.new

desc 'Download the latest schema and build a new client'
task :build do
#  sh 'curl -o schema.json -H "Accept: application/vnd.heroku+json; version=3" https://api.heroku.com/schema'
  sh 'bundle exec heroics-generate ./config/client-config.rb > lib/semaphoreci_api/client.rb'
end

desc 'Publish API documentation'
task :publish do
  sh 'rake yard'
  sh 'cp -R doc /tmp/semaphoreci-api-doc'
  sh 'git checkout gh-pages'
  sh 'cp -R /tmp/semaphoreci-api-doc/* .'
  sh 'rm -rf /tmp/semaphoreci-api-doc'
  sh 'git add .'
  sh 'git commit -am "Rebuild documentation"'
  sh 'git push origin gh-pages'
  sh 'git checkout master'
end

begin
  require "rspec/core/rake_task"
  RSpec::Core::RakeTask.new(:spec)
  task :default => :spec
rescue LoadError
end
