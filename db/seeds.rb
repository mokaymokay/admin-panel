# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Admin.create(first_name: "Albus", last_name: "Dumbledore").build_profile(username: "dumbledore", password: "muggles").save
Instructor.create(first_name: "Minerva", last_name: "McGonagall", age: 65, salary: 60000, degree: "PhD").build_profile(username: "mcgonagall", password: "muggles").save
Instructor.create(first_name: "Severus", last_name: "Snape", age: 50, salary: 60000, degree: "Masters").build_profile(username: "snape", password: "muggles").save
Instructor.create(first_name: "Remus", last_name: "Lupin", age: 45, salary: 55000, degree: "College").build_profile(username: "lupin", password: "muggles").save
Student.create(first_name: "Harry", last_name: "Potter", age: 15, degree: "HS")
Student.create(first_name: "Ronald", last_name: "Weasley", age: 15, degree: "HS")
Student.create(first_name: "Hermione", last_name: "Granger", age: 15, degree: "PhD")
Student.create(first_name: "Draco", last_name: "Malfoy", age: 15, degree: "HS")
Course.create(name: "Transfiguration", hours: 70)
Course.create(name: "Defense Against the Dark Arts", hours: 80)
Course.create(name: "Potions", hours: 65)
Cohort.create(name: "Transfiguration 101", start_date: Faker::Date.backward(100), end_date: Faker::Date.forward(100), course_id: 1, instructor_id: 1)
Cohort.create(name: "Defense Against the Dark Arts 101", start_date: Faker::Date.backward(100), end_date: Faker::Date.forward(100), course_id: 2, instructor_id: 2)
Cohort.create(name: "Potions 101", start_date: Faker::Date.backward(100), end_date: Faker::Date.forward(100), course_id: 3, instructor_id: 3)
Grade.create(pass: true, student_id: 1, cohort_id: 1)
Grade.create(pass: true, student_id: 1, cohort_id: 2)
Grade.create(pass: false, student_id: 1, cohort_id: 3)
Grade.create(pass: true, student_id: 2, cohort_id: 1)
Grade.create(pass: true, student_id: 2, cohort_id: 2)
Grade.create(pass: false, student_id: 2, cohort_id: 3)
Grade.create(pass: true, student_id: 3, cohort_id: 1)
Grade.create(pass: true, student_id: 3, cohort_id: 2)
Grade.create(pass: true, student_id: 3, cohort_id: 3)
Grade.create(pass: true, student_id: 4, cohort_id: 1)
Grade.create(pass: true, student_id: 4, cohort_id: 2)
Grade.create(pass: true, student_id: 4, cohort_id: 3)
