# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Page.create([
  {:name => "¿Qué es ISBN?", :content => "El ISBN ..."},
  {:name => "Vitamina L", :content => "Vitamina L ..."},
  {:name => "¿Quiénes somos?", :content => "Quienes somos"}
])

User.create([
  {:email => "nhocki@gmail.com", :login => "nhocki", :password => 1234, :name => "Nicolás Hock Isaza"},
  {:email => "jfelipe38@gmail.com", :login => "jfelipe38", :password => 1234, :name => "Juan Felipe Arango"}
])