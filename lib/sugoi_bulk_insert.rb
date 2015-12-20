require "sugoi_bulk_insert/version"

module SugoiBulkInsert
  class AroundQuoteIterator
    include Enumerable

    def initialize(collection)
      @collection = collection
    end

    def each
      for item in @collection do
        yield "`#{item}`"
      end
    end
  end

  def self.new(*args, &block)
    Builder.new(*args, &block)
  end

  class Builder
    def initialize(table_name: "hoge", count: 1000)
      @table_name = table_name
      @count = count
      @table_info = {}
      yield(self)
    end

    def column(name, value)
      @table_info[name] = value
    end

    def fire
      ActiveRecord::Base.connection.execute(to_sql)
    end

    def to_sql
      "INSERT INTO `#{@table_name}` (#{columns}) VALUES #{values}"
    end

    private

    def columns
      AroundQuoteIterator.new(@table_info.keys).map(&:itself).join(',')
    end

    def values
      list = []
      @count.times do
        value = AroundQuoteIterator.new(@table_info.values).map { |x|
          case x
          when Array
            x.sample
          when Range
            Random.rand(x)
          else
            x
          end
        }
        list << "(#{value.join(',')})"
      end
      list.join(',')
    end
  end
end
