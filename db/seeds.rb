# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  unless User.exists?
    FactoryBot.create_list(:user, 5)
  end

  unless Workspace.exists?
    workspaces = FactoryBot.create_list(:workspace, 5)
    user = User.first
    user.workspaces << workspaces
    workspaces.each do |workspace|
      user.boards << FactoryBot.create_list(:board, 5, workspace: workspace)
    end
  end
end
