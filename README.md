# Rails App Generator Template

> This application generator will pre-install and configure the following items:

- RSpec, rails-controller-testing, and Capybara for specs and will run Rspec generator
- Devise, with a `users` table and views
- Use `slim` for templating and convert all files to slim
- It will install and configure `Bootstrap`
- It will integrate growl like notifications
- It integrates font-awesome
- Sets up a default homepage
- Integrated Kaminari for pagination, with config and views

TODO: Install and configure:

- petergate
- font awesome
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
