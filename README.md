# Rails Template Generator

> This application generator will pre-install and configure the following items:

- RSpec, rails-controller-testing, and Capybara for specs and will run Rspec generator
- Devise, with a `users` table and views
- Use `slim` for templating and convert all files to slim
- It will install and configure `Bootstrap`

TODO: Install and configure:

- gritter
- petergate
- font awesome
- possible kaminari
- Add new devcamp homepage, maybe something funny


## Additionally, it will:

- Create and migrate the databases
- Convert all `erb` files to `slim`
- Initialize a new git repository and perform the initial commit
- Add the `secrets.yml` file to `.gitignore`


> To run the generator, generate the app with the following command:

```
rails new <app-name> -m https://raw.githubusercontent.com/jordanhudgens/rails-app-generator-template/master/app_template.rb
```
