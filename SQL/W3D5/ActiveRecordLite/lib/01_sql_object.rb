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
    all_records = DBConnection.execute(<<-SQL)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}
    SQL

    self.parse_all(all_records)
  end

  def self.parse_all(results)
    # ...
    results.map do |result|
      self.new(result)
    end
  end

  def self.find(id)
    # ...
    record_with_id = DBConnection.execute(<<-SQL, id)
      SELECT
        #{self.table_name}.*
      FROM
        #{self.table_name}
      WHERE
        id = ?
    SQL

    self.parse_all(record_with_id).first
  end

  def initialize(params = {})
    # ...
    params.each do |key, val|
      raise "unknown attribute '#{key}'" unless self.class.columns.include?(key.to_sym)
      self.send(key.to_s + "=", val)
    end
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
    self.class.columns.map { |col| self.send(col) }
  end

  def insert
    # ...
    col_names = self.class.columns.join(",")
    question_marks = (["?"] * self.class.columns.length).join(",")

    DBConnection.execute(<<-SQL, attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL

    self.id = DBConnection.last_insert_row_id
  end

  def update
    # ...
    set_line = self.class.columns.map { |col| "#{col} = ?"}.join(",")

    DBConnection.execute(<<-SQL, attribute_values, self.id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_line}
      WHERE
        id = ?
    SQL
  end

  def save
    # ...
    self.id.nil? ? self.insert : self.update
  end
end