# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Stopword.create [
  {
    stop_word: "and",
  },
  {
    stop_word: "the",
  },
  {
    stop_word: "is",
  },
  {
    stop_word: "a",
  },
  {
    stop_word: "if",
  },]