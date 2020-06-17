> A twitter clone made with Ruby on Rails




#### Navigation

- [About](#About)


- [Built with](#Built-with)

- [Getting started](#Getting-started)

  - [Setup](#Setup)

    - [TailwindCSS](#TailwindCSS)

  - [Usage](#Usage)

- [Testing](#Testing)

- [Author](#Author)

- [Contributing](#Contributing)

- [Credits](#Credits)

- [License](#License)

- [Gallery](#Gallery)

## About

- This is the capstone project of the Ruby on Rails section at 
[Microverse](https://microverse.org). 
- It is a fully functional web app, 
a social network where you can share recipes, and search through them by ingredients. 

### Built with

- VSCode
- Ruby on Rails
- AWS S3
- TailwindCSS
- SQLite
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
- LinkedIn: [Stefan Dili](https://www.linkedin.com/in/stefan-dili/)
- Twitter: [@dilistefan](https://twitter.com/dilistefan)
- Email: stefan.dili.021@gmail.com

## Contributing

- Contributions, issues, and feature requests are welcome! If you have something
in mind please visit the 
[issues page](https://github.com/dili021/rails-capstone/issues)

## Credits

- Credits go to Microverse for providing the materials, and [Gregoire Vella](https://www.behance.net/gregoirevella) for the design

## License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.

## Gallery

![image](https://user-images.githubusercontent.com/55356496/84882289-4c970900-b08f-11ea-99aa-8852c92809ac.png) <br><br>
![image](https://user-images.githubusercontent.com/55356496/84881539-4ce2d480-b08e-11ea-904f-340af8db0bdb.png) <br><br>
![image](https://user-images.githubusercontent.com/55356496/84882165-21acb500-b08f-11ea-8a75-015be3591c93.png) <br><br>
![image](https://user-images.githubusercontent.com/55356496/84882212-34bf8500-b08f-11ea-870e-41d198f427df.png)

