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


## Polymorphic Associations

- Polymorphic associations may save the day in certain scenarios. Despite the scary name, the idea is simple: you have a model that may belong to many different models on a single association. Suppose, you are going to make games and users commentable. Of course, you might have two separate models called UserComment and GameComment but, all in all, comments are very similar except for the fact that they belong to different models. That’s when polymorphic associations come into play.

- Create a new Comment model:
- `$ rails g model Comment body:text commentable_id:integer:index commentable_type:string`

- Probably, you are already getting the idea. `commentable_id` is a foreign key to establish relation with other tables. `commentable_type`, in turn, will contain the actual name of a model to which a comment belongs. The migration:

```ruby
create_table :comments do |t|
  t.text :body
  t.integer :commentable_id
  t.string :commentable_type

  t.timestamps
end
add_index :comments, :commentable_id

```

- can be re-written as:

```ruby
create_table :comments do |t|
  t.text :body
  t.references :commentable, polymorphic: true, index: true

  t.timestamps
end
add_index :comments, :commentable_id
```

- Apply the migration:
- `$ rake db:migrate`

- The `Comment` model is going to have the `belongs_to` association, but with a small twist:

- `models/comment.rb`
```ruby
belongs_to :commentable, polymorphic: true
```
- As long as we called our fields `:commentable_id` and `:commentable_type`, the whole relation has to be called commentable.

- Now the User and Game models:
- `models/user.rb`
```ruby
has_many :comments, as: :commentable
```

- `models/game.rb`
```ruby
has_many :comments, as: :commentable
```

- `:as` is a special option explaining that this is a polymorphic association. Now, boot your console and try running:

- `$ u = User.create`
-  `$ u.comments.create({body: 'test'})`

- Inside the comments table, `commentable_type` will be set to `User` and `commentable_id` to `user_id`.
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

