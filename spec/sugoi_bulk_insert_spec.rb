require 'spec_helper'
require 'pry'

describe SugoiBulkInsert do
  it 'has a version number' do
    expect(SugoiBulkInsert::VERSION).not_to be nil
  end

  describe '#to_sql' do
    it 'insert record' do
      b = SugoiBulkInsert.new(table_name: "comments", count: 3) do |x|
        x.column :commentable_type, %w(AAA VVV CCC GGG)
        x.column :commentable_id, 1..300000
        x.column :title, 'aaaa'
        x.column :body, 'aaaa'
      end
      b.fire
      expect(Comment.count).to eq 3
    end
  end
end
