require_relative('../db/sql_runner')


class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :age, :house_id

  def initialize(options)
    @id = options['id'].to_i
    @house_id = options['house_id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
  end

  def save()
    sql = "INSERT INTO students (
    first_name,
    last_name,
    house_id,
    age
    ) VALUES (
    $1, $2, $3, $4
    )
    RETURNING id;"
    values = [@first_name, @last_name, @house_id, @age]
    student = SqlRunner.run(sql, values).first
    @id = student['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM students;"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM students;"
    values = []
    students = SqlRunner.run(sql, values)
    result = students.map {|student| Student.new(student)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1;"
    values = [id]
    student = SqlRunner.run(sql, values)
    result = Student.new(student.first)
    return result
  end

  def update()
    sql = "UPDATE students SET (first_name, last_name, age, house_id) = ($1, $2, $3, $4) WHERE id = $5; "
    values = [@first_name, @last_name, @age, @house_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM students WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def house()
    sql = "SELECT houses.name FROM houses WHERE id = $1;"
    values = [@house_id]
    result = SqlRunner.run(sql, values).first
    return result['name']
  end

  # def self.assign()
  #   sql = "SELECT id FROM houses"
  #   values = []
  #   ids = SqlRunner.run(sql, values)
  #   results = ids.map{|id| id['id'].to_i}
  #   new_id = results.sample
  #   return new_id
  #
  # end


end
