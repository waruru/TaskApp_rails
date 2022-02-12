# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Workspace.exists?
  user = User.where(
    unique_id: "@test_user",
    email: "test@test.com",
    password: 'password',
    password_confirmation: 'password'
  ).first_or_create
  workspace = user.workspaces.create(name: 'テストワークスペース01')
  board = workspace.boards.create(name: 'テストボード01')
  BoardUser.create(user: user, board: board)
  task_list = board.task_lists.create(name: 'テストリスト01')
  board.task_lists.create(name: 'テストリスト02')
  task_list.tasks.create(title: "テストタスク01")
  task_list.tasks.create(title: "テストタスク02")
  task_list.tasks.create(title: "テストタスク03")
end
