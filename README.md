![](https://img.shields.io/badge/Microverse-blueviolet)

# One-to-one Associations

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


## One-to-one
>With one-to-one relations you are basically saying that a record contains exactly one instance of another model. For example, let’s store user’s address in a separate table called addresses. This table must contain a foreign key which is by default named after the relation:

- `$ rails g model Address street:string city:string country:string user_id:integer:index`
- `$ rake db:migrate`

- For the user simply say:
- `models/user.rb`
- `has_one :address`

- Having this in place, you may call methods like:
- `user.address` – fetches the related address
- `user.build_address` – same as the method provided by belongs_to; instantiates a new address, but does not
save it into the database.
- `user.create_address` – instantiates a new address, and saves it into the database.

- The `has_one` relation allows you to define `:class_name`, `:dependent`, `:foreign_key`, and other options, just like with has_many.
- `
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

