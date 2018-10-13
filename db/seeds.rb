# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    users_list = [
        ["normaluser", "normal@example.com", "123456", "123456"]
    ]

    admins_list = [
        ["adminuser", "admin@example.com", "123456", "123456"]        
    ]

    mods_list = [
        ["moderatoruser", "moderator@example.com", "123456", "123456"]
    ]

    users_list.each do |username, email, password, password_confirmation|
      user = User.new
      user.username = username
      user.email = email
      user.password = password
      user.password_confirmation = password_confirmation
      user.save!
    end

    admins_list.each do |username, email, password, password_confirmation|
      user = User.new
      user.username = username
      user.email = email
      user.password = password
      user.password_confirmation = password_confirmation

      user.add_role "admin"
      user.save!
    end

    mods_list.each do |username, email, password, password_confirmation|
      user = User.new
      user.username = username
      user.email = email
      user.password = password
      user.password_confirmation = password_confirmation

      user.add_role "moderator"
      user.save!
    end