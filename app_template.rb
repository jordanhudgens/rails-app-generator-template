run 'gem install html2slim'

gem 'rspec-rails', '~> 3.5', '>= 3.5.2'
gem 'capybara', '~> 2.13'
gem 'factory_girl_rails', '~> 4.8'
gem 'rails-controller-testing'
gem 'slim-rails', '~> 3.1', '>= 3.1.2'
gem 'devise', '~> 4.2'
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'gritter', '~> 1.2'
gem 'hirb'
gem 'petergate', '~> 1.7'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.1'
gem 'kaminari', '~> 1.0', '>= 1.0.1'
gem 'devcamp_view_tool', '~> 0.1.0'

run 'bundle install'

run 'rails db:create'


run 'mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss'
run "echo \"@import 'gritter';\" >> app/assets/stylesheets/application.scss"
run "echo \"@import 'bootstrap';\" >> app/assets/stylesheets/application.scss"
run "echo \"@import 'font-awesome';\" >> app/assets/stylesheets/application.scss"
run "echo \"//= require gritter\" >> app/assets/javascripts/application.js"
run "echo \"//= require bootstrap-sprockets\" >> app/assets/javascripts/application.js"

generate 'rspec:install'
generate 'devise:install'
generate 'devise User'
generate 'devise:views'
generate 'gritter:locale'
generate 'kaminari:config'
generate 'kaminari:views default'

run 'erb2slim app/views -d'
run 'rails g controller Static home'

files = [
  { 'lib/application.html.slim' => 'app/views/layouts/application.html.slim' },
  { 'lib/application_helper.rb' => 'app/helpers/application_helper.rb'},
  { 'lib/application.rb' => 'config/application.rb'},
  { 'lib/home.html.slim' => 'app/views/static/home.html.slim'},
  { 'lib/routes.rb' => 'config/routes.rb'},
  { 'lib/images/logo.png' => 'app/assets/images/logo.png'},
  { 'lib/rails_helper.rb' => 'spec/rails_helper.rb'},
]

files.each do |f|
  source_file = File.join(File.dirname(__FILE__), f.keys.first)
  run "cp #{source_file} #{f.values.last}"
end

run 'erb2slim app/views -d'

run 'rails db:migrate'

generate 'petergate:install'
run 'rails db:migrate'

git :init
run 'echo config/secrets.yml >> .gitignore'
git add: '--all', commit: '-m "Initial Commit"'

run 'open http://localhost:3000 | rails s'
