$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'sugoi_bulk_insert'
require "active_record"
require "mysql2"
require 'pry'

ActiveRecord::Base.establish_connection(
  adapter:   'mysql2',
  username: :root,
  database: :sugoi_bulk_insert,
)
ActiveRecord::Migration.drop_table :comments
ActiveRecord::Migration.create_table :comments do |t|
  t.string :commentable_type
  t.integer :commentable_id
  t.string :title
  t.text :body
end

class Comment < ActiveRecord::Base
end
