# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


angela = User.create(firstName: 'Angela', lastName: 'Lam', company: 'Microsoft', bio: 'New to the tech field! Would love to connect with SWEs with more experience!', role: 'mentee', email: 'angela@email.com', password: '123456')

User.create(firstName: 'Bob', lastName: 'Smit', company: 'Amazon', bio: 'Five years as a SWE. Happy to share my knowledge!', role: 'mentor', email: 'bob@email.com', password: '123456')

User.create(firstName: 'Thomas', lastName: 'Williams', company: 'Yahoo', bio: 'I want to meet and help those new to the field.', role: 'mentor', email: 'thomas@email.com', password: '123456')

User.create(firstName: 'Emily', lastName: 'Lee', company: 'Facebook', bio: 'Two years in the field but I want to learn more!', role: 'mentee', email: 'emily@email.com', password: '123456')

anna = User.create(firstName: 'Anna', lastName: 'Kim', company: 'Google', bio: 'Senior developer at Google. Excited to talk to new faces!', role: 'mentor', email: 'anna@email.com', password: '123456')

Connection.create(follower_id: anna.id, followed_id: angela.id)