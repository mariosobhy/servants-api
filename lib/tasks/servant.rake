namespace :servant do
  task add_roles_to_users: :environment do
    User.update_all(role: 'user')
  end
end