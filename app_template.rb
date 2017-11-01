# Gem required for template conversion to slim
run 'gem install html2slim'

# Gems for testing and using RSpec
gem 'rspec-rails', '~> 3.7', '>= 3.7.1'
gem 'capybara', '~> 2.15', '>= 2.15.4'
gem 'rails-controller-testing'

# Using slim instead of erb templates
gem 'slim-rails', '~> 3.1', '>= 3.1.3'

# Authorization and authentication
gem 'pundit', '~> 1.1'
gem 'devise', '~> 4.3'

# Styles
gem 'bootstrap', '~> 4.0.0.beta2.1'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.2'
gem 'gritter', '~> 1.2'

# Helpful utilities
gem 'hirb', '~> 0.7.3'
gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'devcamp_view_tool', '~> 0.1.0'
gem 'faker', '~> 1.8', '>= 1.8.4'

run 'bundle install'

run 'rails db:create'

# Configures style related items, such as Bootstrap, gritter, and font awesome
run 'mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss'
run "echo \"@import 'gritter';\" >> app/assets/stylesheets/application.scss"
run "echo \"@import 'bootstrap';\" >> app/assets/stylesheets/application.scss"
run "echo \"@import 'font-awesome';\" >> app/assets/stylesheets/application.scss"
run "echo \"//= require gritter\" >> app/assets/javascripts/application.js"
run "echo \"//= require bootstrap-sprockets\" >> app/assets/javascripts/application.js"

# Runs main generators
generate 'rspec:install'
generate 'pundit:install'
generate 'devise:install'
generate 'devise User'
generate 'devise:views'
generate 'gritter:locale'
generate 'kaminari:config'
generate 'kaminari:views default'

# Converts templates to slim
run 'erb2slim app/views -d'

# Builds the homepage
run 'rails g controller Static home'

# Preconfigured files in lib and mapping to files in the new app
files = [
  { 'lib/application.html.slim' => 'app/views/layouts/application.html.slim' },
  { 'lib/application_helper.rb' => 'app/helpers/application_helper.rb'},
  { 'lib/application.rb' => 'config/application.rb'},
  { 'lib/home.html.slim' => 'app/views/static/home.html.slim'},
  { 'lib/routes.rb' => 'config/routes.rb'},
  { 'lib/images/logo.png' => 'app/assets/images/logo.png'},
  { 'lib/rails_helper.rb' => 'spec/rails_helper.rb'},
]

# Iterates over the file list and copies them over into the newly built app
files.each do |f|
  source_file = File.join(File.dirname(__FILE__), f.keys.first)
  run "cp #{source_file} #{f.values.last}"
end

run 'rails db:migrate'

# Creates git repo and makes first commit
git :init
run 'echo config/secrets.yml >> .gitignore'
git add: '--all', commit: '-m "Initial Commit"'

# Opens the browser and starts up the rails server
run 'open http://localhost:3000 | rails s'
