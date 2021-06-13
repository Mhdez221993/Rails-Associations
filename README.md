![](https://img.shields.io/badge/Microverse-blueviolet)

# Rails Associations

> A one-to-many association is probably the most common and widely used type. The idea is pretty simple: record A may have many records B and record B belongs to only one record A. For each record B you have to store an id of the record A it belongs to – this id is called a foreign key.

- One-to-many

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

## One-to-many Associations

-Suppose, we have a user that may have a bunch of posts.

- `$ rails g model User name:string`
- As for the posts table, it has to contain a foreign key and the convention is to name this column after the related table

- `$ rails g model Post user:references body:text`

- user:references is a neat way to define a foreign key – it will automatically name the corresponding column user_id and add an index on it.

- you can also say:
- `$ rails g model Post user_id:integer:index body:text`

- Apply your migrations:

- `rails db:migrate`

- As long as we used the references keyword when generating migration, the Post model will already have the following line:

- `belongs_to :user`

- Still, the User has to be modified manually:

- `models/user.rb`

- `has_many :posts`

- Note the plural form `(“posts“)` for the relation’s name. For the `belongs_to` relation, you use the singular form `(“user”)`.

- Now the relation is established and you can use methods like:

- `user.posts` – references user’s posts
- `user.posts << post` – establishes a new relation between a user and a post
- `post.user` – references an owner of the post
- `user.posts.build({ })` – instantiates a new post for the user, but doesn’t save it into the database yet. It does populate the user_id attribute on the post. This is similar to saying Post.new({user_id: user.id}).
- `user.posts.create({ })` – creates a new post and saves it into the database.
- `post.build_user` – same as above, instantiates a new user without saving it.
- `post.create_user` – same as above, instantiates and saves the user into the database.

- Suppose, for example, that you want the  `belongs_to`   relation to be called `author`, not `user`:

- `models/post.rb`
- `belongs_to :author, class_name: 'User'`

- `models/post.rb`
- `belongs_to :author, class_name: 'User', foreign_key: 'user_id'`

- Now, inside your console you may do something like:
- `$ post = Post.new `
- `$ post.create_author`

- Another common option that you can set is `:dependent`, usually for the `has_many` relatio

- The `:dependent` option accepts the following values:
- `:destroy` – all associated objects will removed one by one (in a separate query).
- `:delete_all` – all associated objects will be deleted in a single query.
- `:nullify` – foreign keys for the associated objects will be set to NULL.
- `:restrict_with_exception` – if there are any associated records, an exception will be raised.
- `:restrict_with_error` – if there are any associated records, an error will be added to the owner (the record you are trying to delete).

- `models/user.rb`
- `has_many :posts, dependent: :destroy`

- `belongs_to` also supports the `:dependent` option – it may be set to either `:destroy` or `:delete`x`.

- you cannot create a record if its parent does not exist:
- `Post.create({user_id: nil})`
- This new feature may be disabled for the whole app by tweaking the following initializer file:
- `Rails.application.config.active_record.belongs_to_required_by_default = false # default is true`
- Also you may set the :optional setting for the individual relations:
- `belongs_to :author, optional: true`

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

