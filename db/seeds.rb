# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


if Link.count.zero?
  Link.create(name: "Ruby")
  Link.create(name: "Javascript")
  Link.create(name: "HTML")
  Link.create(name: "CSS")
  Link.create(name: "Command Line")
  Link.create(name: "Communication")
  Link.create(name: "Project Work")
  Link.create(name: "TDD")
  Link.create(name: "Agile")
  Link.create(name: "OOP")
  Link.create(name: "Rails")
  Link.create(name: "Databases")
  Link.create(name: "ORM")
  Link.create(name: "jQuery")
  Link.create(name: "Version Control")


  Link.all.each do |link|
    link.start_mechanize('https://google.co.uk')
    link.search_skill(link)
  end
end
