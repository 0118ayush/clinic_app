require_relative './config/environment'
require 'sinatra/activerecord/rake'

desc 'Start our app console'
task :console do
    Pry.start
end

desc "run the CLI"
task :run do
  cli = CLI.new
  cli.run
end
