# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all

Product.create(name: 'Programming Ruby',
               description: 
               %{<p> Ruby is .... </p>},
               image_url: '1.jpg',
               price: 100)

Product.create(name: '2nd Programming Ruby',
               description: 
               %{<p> Ruby is ddd .... </p>},
               image_url: '2.jpg',
               price: 100)

Product.create(name: 'Ruby Language',
               description: 
               %{<p> It's Ruby .... </p>},
               image_url: '3.png',
               price: 100)

Product.create(name: 'Programming Ruby',
               description: 
               %{<p> Ruby is .... </p>},
               image_url: '4.jpg',
               price: 100)
