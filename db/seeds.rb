# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.all.empty?
    User.create(first_name: 'Jordan', last_name: 'Bell', password: 'Test12345!', email: 'jayymbell@gmail.com', activated: true, activated_at: Time.now)
end

if Permission.all.empty?
    Permission.create(subject: 'users', activity: 'create')
    Permission.create(subject: 'users', activity: 'delete')
    Permission.create(subject: 'users', activity: 'deactivate')
    Permission.create(subject: 'users', activity: 'edit')
    Permission.create(subject: 'users', activity: 'search')
    Permission.create(subject: 'users', activity: 'view')

    Permission.create(subject: 'groups', activity: 'create')
    Permission.create(subject: 'groups', activity: 'delete')
    Permission.create(subject: 'groups', activity: 'edit')
    Permission.create(subject: 'groups', activity: 'search')
    Permission.create(subject: 'groups', activity: 'view')

    Permission.create(subject: 'permissions', activity: 'create')
    Permission.create(subject: 'permissions', activity: 'edit')
    Permission.create(subject: 'permissions', activity: 'search')
    Permission.create(subject: 'permissions', activity: 'view')
end

if Group.all.empty?
    developers_group = Group.create(name: 'Developers')
    developers = User.where("email IN (?)", ["jayymbell@gmail.com"])
    # add developers to developer group
    developers.each do |developer|
        developers_group.users << developer
    end
    # give developers group all permissions
    Permission.all.each do |permission|
        permission.groups << developers_group
    end
end

