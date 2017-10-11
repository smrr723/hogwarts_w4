require_relative('../db/sql_runner')


class House

attr_reader :id
attr_accessor :name, :url

def initialize( options )
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @url = options['url']
end

def save()
  sql = 'INSERT INTO houses (name, url) VALUES ($1, $2) RETURNING id;'
  values = [@name, @url]
  house = SqlRunner.run(sql, values).first
  @id = house['id'].to_i
end

def self.delete_all()
  sql = "DELETE FROM houses"
  values = []
  SqlRunner.run(sql, values)
end

def self.all()
  sql = "SELECT * FROM houses"
  values = []
  houses = SqlRunner.run(sql, values)
  result = houses.map{|house| House.new( house )}
  return result
end

def self.find( id )
  sql = "SELECT * FROM houses WHERE id = $1"
  values = [id]
  student = SqlRunner(sql, values)
  result = House.new( house.first )
  return result
end


end
