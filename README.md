# SugoiBulkInsert


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sugoi_bulk_insert'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sugoi_bulk_insert

## Usage

```ruby
b = SugoiBulkInsert.new(table_name: "comments", count: 30000) do |x|
  x.column :commentable_type, %w(AAA VVV CCC GGG)
  x.column :commentable_id, 1..300000
  x.column :title, 'aaaa'
  x.column :body, 'aaaa'
end
b.fire # => insert!
b.to_sql # => display insert sql
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sugoi_bulk_insert.
