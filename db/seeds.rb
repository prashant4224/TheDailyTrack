# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	team = Team.create({ name: 'First Team', description: 'Team desc' })
	plan = team.plans.create({name: 'First Plan', description: 'Plan desc', start_date: "2015-04-22 05:33:04", end_date: "2015-04-22 05:33:04"})
	AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
	Product.create!(price: "23.75", author: "David Flanagan and Yukihiro Matsumoto ", title: "The Ruby Programming Language", avatar: "the-ruby-programming-language.jpg", featured: true, available_on: "2011-02-16")