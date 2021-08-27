# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


angela = User.create(firstName: 'Angela', lastName: 'Lam', company: 'Microsoft', bio: 'New to the tech field! Would love to connect with SWEs with more experience!', email: 'angela@email.com', password: '123456')

bob = User.create(firstName: 'Bob', lastName: 'Smit', company: 'Amazon', bio: 'Five years as a SWE. Happy to share my knowledge!', email: 'bob@email.com', password: '123456')

thomas = User.create(firstName: 'Thomas', lastName: 'Williams', company: 'Yahoo', bio: 'I want to meet and help those new to the field.', email: 'thomas@email.com', password: '123456')

emily = User.create(firstName: 'Emily', lastName: 'Lee', company: 'Facebook', bio: 'Two years in the field but I want to learn more!', email: 'emily@email.com', password: '123456')

anna = User.create(firstName: 'Anna', lastName: 'Kim', company: 'Google', bio: 'Senior developer at Google. Excited to talk to new faces!', email: 'anna@email.com', password: '123456')

will = User.create(firstName: 'Will', lastName: 'Chou', company: 'Microsoft', bio: 'Developer at Microsoft.', email: 'will@email.com', password: '123456')

Connection.create(follower_id: anna.id, followed_id: angela.id)

Connection.create(follower_id: angela.id, followed_id: bob.id)

Post.create(user_id: anna.id, content: "Learning a new social media is difficult...")

Post.create(user_id: bob.id, content: "Don't hesitate to reach out to me and chat a bit!")

Post.create(user_id: anna.id, content: "I'm enjoying all the new people sync-ing with me! :)")

Post.create(user_id: emily.id, content: "Lowkey nervous to connect to random people I don't know, but I'll connect to as many people as I can!")

Post.create(user_id: thomas.id, content: "First post for me. I don't know what to say lol")

Post.create(user_id: angela.id, content: "I love this site!")

Post.create(user_id: emily.id, content: "Does anyone want to be my mentor?")

Post.create(user_id: bob.id, content: "Today has been a stressful day. I keep running into bug after bug.")