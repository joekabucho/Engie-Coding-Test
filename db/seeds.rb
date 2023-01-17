# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.firs

ModelAttribute.create(model_type: 'customer', attribute_name: 'email')
ModelAttribute.create(model_type: 'battery', attribute_name: 'model')


 CustomAttribute.create(model_type: 'customer',model_id: 1, attribute_name: 'email',attribute_value: 'joekabucho2@gmail.com')
CustomAttribute.create(model_type: 'battery',model_id: 2, attribute_name: 'model',attribute_value: 'total')



