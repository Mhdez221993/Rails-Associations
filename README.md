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

# “Has and Belongs to Many” Association

- Many-to-many associations are a bit more complex and can be set up in two ways. First of all, let’s discuss a direct relation, without any intermediate models. It is called “has and belongs to many” or simply “HABTM”.

- Suppose, a user can enroll in many different events and an event may contain many users.  To achieve this goal, we require a separate table (often called a “join table”) that stores relations between users and events. This table has to have a special name: users_events. Basically, it is just a combination of the two tables’ names that we are establishing relation between.

- Firstly, create events:
- `$ rails g model Event title:string`

- Now the intermediate table:
- `$ rails g migration create_events_users user:references event:references`
- `$ rake db:migrate`

- Note the name of the intermediate table – Rails expects it to be composed of two tables’ names (`events` and `users`). Moreover, the higher-order name (`events`) should be the first one (`events > users`, because letter “e” precedes letter “u”).The last step is to add the `has_and_belongs_to_many` to both models:
- `model/user.rb`
- `has_and_belongs_to_many :events`
- `model/event.rb`
- `has_and_belongs_to_many :users`


- Now you may call methods like:
- `user.events`
- `user.events << [event1, event2]` – creates relations between a user and a bunch of events
- `user.events.destroy(event1)` – destroys relation between records (the actual records won’t be removed). There is also a `delete` method that does pretty much same except it does not run callbacks
- `user.event_ids` – a neat method that returns an array of ids from the collection
- `user.event_ids = [1,2,3]` – makes the collection contain only the objects identified by the supplied primary key values.
Note that if the collection initially contained other objects, they will be removed.
- `user.events.create({})` – creates a new object and adds it to the collection

- `has_and_belongs_to_many` accepts `:class_name` and `:foreign_key `
- `:association_foreign_key `– by default, Rails uses the relation name to find the foreign key in the intermediate table. So, for example, f you say `has_and_belongs_to_many` :users, the `user_id` column will be used. However, that’s not always convenient, so the `:association_foreign_key` can be employed to define a custom column’s name.

- `:join_table` – this option can be used to redefine the name for the intermediate table (that is called `users_events` in our case).



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

