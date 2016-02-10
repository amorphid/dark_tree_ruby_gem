$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'dark_tree'

# load support files
Dir['./spec/support/**/*.rb'].each { |f| require f }
