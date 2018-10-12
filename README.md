# README

Joe's List is a partial clone of Craig's List, just for fun.

Requirements
* Ruby 2.5.1
* Rails 5.2.1

Clone the code with

git clone https://github.com/fairanswers/joes_list

Gems we'll need (in addition to the defaults)

* devise - authentication
* to_words - sets up interesting test data.

After you clone the code, cd joes_list and run
1. bundle install
2. rails db:migrate
3. rails db:seed
4. rails server

This will give you a nice list of categories to get started with.  

Anonymous users can browse categories and posts.  tester@example.com
is created by the seed with the password 'tester' (no quotes).

Logged in users can manipulate categories and posts.  Normally we'd add roles so
posts would belong to users and only admins would be able to edit categories.  We
can also add a 'Reply To' button on each post, pictures, and a host of other features.

Validations include some lengths on fields and no inappropriate words in the posts.
That validation hard-codes the word 'inappropriate', but that could easily made a database table for an admin to
configure.

The last thing I added was smart deletes.  Deleting a post sends you back to category you were in
instead of an index to all the posts in the database. Deleting a category warns you of how many posts you'll delete in a confirmation.
