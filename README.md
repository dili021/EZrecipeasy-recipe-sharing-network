> A social network for sharing delicious recipes built with Ruby on Rails




#### Navigation

- [About](#About)


- [Try it out](#Try-it-out)

- [Built with](#Built-with)

- [Getting started](#Getting-started)

  - [Setup](#Setup)

    - [TailwindCSS](#TailwindCSS)

  - [Usage](#Usage)

- [Testing](#Testing)

- [Author](#Author)

- [Contributing](#Contributing)

- [Future features](#Future-features)

- [Credits](#Credits)

- [License](#License)

- [Gallery](#Gallery)

## About

- This is the capstone project of the Ruby on Rails section at 
[Microverse](https://microverse.org). 
- It is a fully functional web app, 
a social network where you can share recipes, and search through them by ingredients. 
- <strong>It's purpose</strong> is implementing what we have previously learned throughout the Ruby on Rails section, i.e. proper use of ActiveRecord, model associations and validations, creating sessions and authentication, using embedded ruby, logic delegation to helpers, scopes, n+1 querry problems, and unit and integration testing. 

## Try it out

- To try it out visit this [live demo link](http://ezrecipeasy.herokuapp.com). <br> You can log in with username `test_user`, or create an account.

## Built with

- VSCode
- Ruby on Rails
- AWS S3
- TailwindCSS
- PostgreSQL
- Rubocop
- RSpec, FactoryBot, ShouldaMatchers, Capybara

## Getting started

- Install [Ruby](https://www.ruby-lang.org/en/downloads/) and 
[Rails](https://rubyonrails.org/). You will need at least versions 2.6.5 and
6 respectively.
- Fork the repository and download it to your machine.

## Setup

- Run `bundle` to install all the required gems. 
- Run `rails db:migrate db:seed` to create the tables and populate with a few
users, posts, and followers. You can check `db/seeds.rb` to see a basic example.

#### TailwindCSS 
Configuration is 
already done but you can take a look at it's [github repo](https://github.com/IcaliaLabs/tailwindcss-rails) if you're interested. As for the classes, here's a 
neat little [cheatsheet](https://nerdcave.com/tailwind-cheat-sheet) to get you
started, and you can always check their [official page](https://tailwindcss.com/).
This is my first project using it, and I'm already in love!

## Usage

- Run `rails server` to start your local server and go to `localhost:3000` or
whatever is your set port.
- Log in with username: `test_user` to have a look around, or create your own 
account.
- You can upload a profile picture and cover image, follow/unfollow users, <br>
post recipes and explore them manually or by using the search bar.

## Testing

- Testing is done with RSpec using FactoryBot factories and Capybara for 
integration tests. <br> to run them simply run `rspec` in your terminal while in 
the root folder of the app.


## Author

#### Stefan Dili
- [Website](https://stefan-dili.tech)
- LinkedIn: [Stefan Dili](https://www.linkedin.com/in/stefan-dili/)
- Twitter: [@dilistefan](https://twitter.com/dilistefan)
- Email: contact@stefan-dili.tech

## Contributing

- Contributions, issues, and feature requests are welcome! If you have something
in mind please visit the 
[issues page](https://github.com/dili021/rails-capstone/issues)

## Future features

- A voting system for the recipes
- New recipe notifications

## Credits

- Credits go to Microverse for providing the materials, and [Gregoire Vella](https://www.behance.net/gregoirevella) for the design

## License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.

## Gallery

Login <br>
![image](https://user-images.githubusercontent.com/55356496/89404723-be4c1480-d71a-11ea-9bba-6f67d35fc447.png)<br><br>
Sign up <br>
![image](https://user-images.githubusercontent.com/55356496/89404881-fce1cf00-d71a-11ea-9112-c6e7d31507a0.png)
Homepage <br>
![image](https://user-images.githubusercontent.com/55356496/89405026-30245e00-d71b-11ea-98c0-8988c5e69e81.png)
Profile page <br>
![image](https://user-images.githubusercontent.com/55356496/89405067-45998800-d71b-11ea-9aa5-4314570e21f5.png)


 <br><br>


