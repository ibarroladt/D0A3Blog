# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# encoding: utf-8
require "csv"

  csv = CSV.read("./seed_blog.csv")
  csv.each do |row|
    Post.create(title: row[0], summary: row[1], content: row[2])
  end
