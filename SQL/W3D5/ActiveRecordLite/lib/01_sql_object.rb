require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    return @column_names if @column_names

    column_names = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
      LIMIT 0
    SQL

    @column_names = column_names.first.map(&:to_sym)
  end

  def self.finalize!
    self.columns.each do |column|
      define_method(column) { self.attributes[column] }

      define_method(column.to_s + "=") do |value|
        self.attributes[column] = value
      end
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    @table_name ||= self.inspect.tableize
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
    params.each do |key, val|
      raise "unknown attribute '#{key}'" unless self.class.columns.include?(key)
      self.send(key.to_s + "=", val)
    end
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end

class Cat < SQLObject

end
