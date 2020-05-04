require_relative 'person'
require 'mongoid'

Mongoid.load!("/home/ericm/github/dividend_champions/config/mongoid.yml")


Person.create(
  first_name: "Heinricheeeee",
  last_name: "Heineeeee"
)
puts "Ran person.create"
