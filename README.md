![](https://img.shields.io/badge/Microverse-blueviolet)

# Rails Associations

> Associations make it much easier to perform various operations on the records in your code. There are multiple types of associations available:

- One-to-one
- One-to-many
- Many-to-many
- Polymorphic one-to-many

## Built With

- Ruby
- Rails

## Getting Started
### To get a local copy run the following steps:

- [Copy this link](git@github.com:Mhdez221993/Rails-Associations.git)
- Open your terminal or command line
- Run `git clone` and Paste the link
- Open the folder with your code editor
- Run `bundle install` to install all dependecies
- Run `yarn install` to install yarn
- Run `rails db:migrate` to create the database tables
- Run `rails server` to open the local server


## Many-to-many
# “Has Many Through”

- Another way to define a many-to-many association is to use the has many through association type. Suppose we have a list of games and, from time to time, competitions on these games are held. Many users may participate in many competitions. Apart from establishing a many-to-many relation between the users and games, we also want to store additional info about each enrollment, like the competition’s category (amateur, semi-pro, pro, etc.)

- First of all, create a new Game model:
- `$ rails g model Game title:string`
- We also need an intermediate table, but this time with a model:
- `rails g model Enrollment game:references user:references category:string`
- `$ rake db:migrate`

- For the Enrollment model everything was set up automatically:
- `models/enrollment.rb`
- `belongs_to :game`
- `belongs_to :user`

- Tweak the two other models:

- `models/user.rb`
- `has_many :enrollments`
-  `has_many :games, through: :enrollments`

- `models/game.rb`
- `has_many :enrollments`
-  `has_many :users, through: :enrollments`

- Here, we explicitly specify the intermediate model to establish this relation. Now you can work with each enrollment as an independent entity, which is more convenient. Note, that if the name of the source association cannot be automatically inferred from the association’s name, you may utilize the :source option and set its value accordingly.

- `has_many :through` is preferred over `has_and_belongs_to_many`


## Authors

👤 **Moises Hernandez**

- [GitHub](https://github.com/Mhdez221993)
- [Twitter](https://twitter.com/MoisesH42060050)
- [LinkedIn](https://www.linkedin.com/in/moises-hdez-coronado/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Mhdez221993/Rails-Associations/issues).

## Credits

The list of third party components used in this project, with due credits to their authors and license terms. More details can be found in the next link.

- Ilya Bodrov-Krukowski
- [credits](https://www.sitepoint.com/brush-up-your-knowledge-of-rails-associations/)
## Show your support

Give a ⭐️ if you like this project!

