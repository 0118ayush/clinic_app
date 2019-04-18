require 'bundler/setup'
require 'colorize'
require 'rainbow'
Bundler.require

require 'terminal-table'

require 'colorized_string'




ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.sqlite'
)

ActiveRecord::Base.logger = Logger.new(STDOUT)



SINATRA_ACTIVESUPPORT_WARNING=false

require_all 'app'
