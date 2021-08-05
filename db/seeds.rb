# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

School.create(
  [
    {name: 'Turquoise Trail Charter School', description: 
      'New Mexico’s oldest charter school and one of the highest-achieving schools in the state, 
      Turquoise Trail Charter School (TTCS) is as eccentric and diverse as the city 
      of Santa Fe itself.', location: '13 San Marcos Loop, Santa Fe, NM 87508'
    },
    {name: 'South Shore', description: 'Together we create a loving community of 
      purposeful learning that focuses on the whole child: 
      body, mind and spirit', location: '4800 S Henderson St Seattle, WA 98118'
    }
  ])

Teacher.create(
  [
    {first_name: 'Amanda', last_name: 'Knox', school: School.first},
    {first_name: 'Paula', last_name: 'Blamo', school: School.last}
  ])

amanda = Teacher.find_by(first_name: 'Amanda')
paula = Teacher.find_by(first_name: 'Paula')

Student.create([
    {first_name: 'Sam', last_name: 'Gugliota', school: School.first},
    {first_name: 'Jason', last_name: 'Amistad', school: School.first},
    {first_name: 'Maria', last_name: 'Grand', school: School.last},
    {first_name: 'Laura', last_name: 'Smith', school: School.last},
    {first_name: 'Brandon', last_name: 'Lucki', school: School.first},
    {first_name: 'Zach', last_name: 'Roca', school: School.first},
    {first_name: 'Paul', last_name: 'Stark', school: School.last},
    {first_name: 'Ben', last_name: 'Stanley', school: School.last}
  ])

Curriculum.create(
  [
    {title: 'History', description: 'Any history class.', capacity: 5},
    {title: 'Math', description: 'Any math class', capacity: 5},
    {title: 'English', description: 'Any English class', capacity: 5}
  ]
)

history = Curriculum.find_by(title: 'History')
math = Curriculum.find_by(title: 'Math')
english = Curriculum.find_by(title: 'English')

Cohort.create(
  [
    {name: 'US History', school: amanda.school, teacher: amanda, curriculum: history},
    {name: 'Math with Amanda', school: amanda.school, teacher: amanda, curriculum: math},
    {name: 'English', school: paula.school, teacher: paula, curriculum: english},
    {name: 'World History', school: paula.school, teacher: paula, curriculum: history}
  ])

start_date = Time.now
end_date = Time.now + 1.year

Enrollment.create(
  [
    {school_id: 1, student_id: 1, cohort_id: 1, start_date: start_date, end_date: end_date},
    {school_id: 1, student_id: 2, cohort_id: 1, start_date: start_date, end_date: end_date},
    {school_id: 1, student_id: 1, cohort_id: 2, start_date: start_date, end_date: end_date},
    {school_id: 2, student_id: 3, cohort_id: 4, start_date: start_date, end_date: end_date},
    {school_id: 2, student_id: 4, cohort_id: 4, start_date: start_date, end_date: end_date},
    {school_id: 2, student_id: 8, cohort_id: 4, start_date: start_date, end_date: end_date},
    {school_id: 2, student_id: 7, cohort_id: 4, start_date: start_date, end_date: end_date}
  ])
