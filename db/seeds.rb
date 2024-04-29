# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

college = College.where(name: "Test College").first_or_create!
exam = college.exams.where(name: "Test exam").first_or_create!
exam.exam_windows.create(start_time: Time.zone.now - 3.days, end_time: Time.zone.now + 3.days)
