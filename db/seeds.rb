require_relative('../models/student')
require_relative('../models/house')
require ('pry-byebug')

Student.delete_all()
House.delete_all()


house1 = House.new({
  "name" => "Gryfinndor",
  "url" => "https://i.pinimg.com/originals/1c/fa/07/1cfa0732cbe110a01dc156002fa56f09.jpg"
  })
house1.save()


house2 = House.new({
  "name" => "Slytherin",
  "url" => "https://i.pinimg.com/originals/1c/fa/07/1cfa0732cbe110a01dc156002fa56f09.jpg"
  })
house2.save()

house3 = House.new({
  "name" => "Ravenclaw",
  "url" => "https://i.pinimg.com/originals/1c/fa/07/1cfa0732cbe110a01dc156002fa56f09.jpg"
  })
house3.save()

house4 = House.new({
  "name" => "Hufflepuff",
  "url" => "https://i.pinimg.com/originals/1c/fa/07/1cfa0732cbe110a01dc156002fa56f09.jpg"
  })
house4.save()



student1 = Student.new({
    "first_name" => "Harry",
    "last_name" => "Potter",
    "house_id" => house1.id,
    "age" => 28
})
student1.save()



student2 = Student.new({
  "first_name" => "Ron",
  "last_name" => "Weasley",
  "house_id" => house2.id,
  "age" => 25
  })
student2.save()

student3 = Student.new({
  "first_name" => "Hermione",
  "last_name" => "Granger",
  "house_id" => house3.id,
  "age" => 25
  })
student3.save()


binding.pry

nil
