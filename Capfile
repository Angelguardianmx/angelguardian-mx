load 'deploy'
load 'deploy/assets'
load 'config/deploy'

recipes = File.join('config', 'deploy', 'recipes', '*.rb')
Dir.glob(recipes).each { |file| load file }