require "sugoi_bulk_insert/version"

module SugoiBulkInsert
  def self.new(*args, &block)
    Builder.new(*args, &block)
  end

  class Builder
    def initialize(table_name: , count: 1000)
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
      @table_info.keys.map { |x| "`#{x}`" }.join(',')
    end

    def values
      list = []
      @count.times do
        value = @table_info.values.map { |x|
          y = case x
              when Array
                x.sample
              when Range
                Random.rand(x)
              else
                x
              end
          y.is_a?(Fixnum) ? y : "'#{y}'"
        }
        list << "(#{value.join(',')})"
      end
      list.join(',')
    end
  end
end
