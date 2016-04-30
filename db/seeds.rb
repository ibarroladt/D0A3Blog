# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# encoding: utf-8
require "csv"

  csv = CSV.read("/Users/Santiago/Sublime/D0A3Blog/db/seed_blog.csv")
  csv.each do |row|
    puts "-" * 100
    puts
    puts row
    puts
    puts "-" * 100
    Post.create(title: row[0], summary: row[1], content: row[2])
  #   puts i
  #   print "User.create(email: '#{row[0]}', password: '123456', 
  #     password_confirmation: '123456', first_name: '#{row[3]}', last_name: '#{row[4]}',
  #     admin: #{row[5].downcase}, phone: '#{row[6]}', cellphone: '#{row[7]}',
  #     group_number: #{row[8]})"
  #   puts
  #   i += 1
  # #   # User.create(email: row[0], password: "123456", password_confirmation: "123456",
  # #   #   first_name: row[3], last_name: row[4], admin: row[5], phone: row[6],
  # #   #   cellphone: row[7], group_number: row[8])
  end

  puts Post.all.count