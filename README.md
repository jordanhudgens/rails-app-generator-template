# Rails App Generator Template

> This application generator will pre-install and configure the following items:

- RSpec, rails-controller-testing, and Capybara for specs and will run Rspec generator
- Installs and configures FactoryGirl for factories
- Devise, with a `users` table and views
- Use `slim` for templating and convert all files to slim
- It will install and configure `Bootstrap`
- It will integrate growl like notifications
- It integrates font-awesome
- Sets up a default homepage
- Integrated Kaminari for pagination, with config and views
- Integrates Petergate for an  authorization engine


## Additionally, it will:

- Create and migrate the databases
- Convert all `erb` files to `slim`
- Initialize a new git repository and perform the initial commit
- Add the `secrets.yml` file to `.gitignore`
- Eager load modules in the `lib` directory


> To run the generator, clone this repo and run the command

```
rails new <app-name> -m <path to the app_template.rb file in this repo>
```
