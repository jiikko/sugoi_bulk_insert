# SugoiBulkInsert

## Requirements

* ruby 2.2.0 later
* MySQL

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
```sql
mysql> show create table comments;
+----------+--------------------------------------+
| Table    | Create Table                                                                                                                                                                                                                                                                                   |
+----------+--------------------------------------+
| comments | CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commentable_type` varchar(255) DEFAULT NULL,
  `commentable_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=480010 DEFAULT CHARSET=utf8 |
+----------+--------------------------------------+
1 row in set (0.00 sec)
```
```ruby
b = SugoiBulkInsert.new(table_name: "comments", count: 300) do |x|
  x.column :commentable_type, %w(AAA VVV CCC GGG)
  x.column :commentable_id, 1..300000
  x.column :title, 'aaaa'
  x.column :body, 'aaaa'
end
b.to_sql # => display insert sql
b.fire # => insert!
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sugoi_bulk_insert.
