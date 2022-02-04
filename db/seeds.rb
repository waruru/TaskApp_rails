# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Workspace.first
  workspace = Workspace.create(name: 'テストワークスペース')
  board = workspace.boards.create(name: 'テストボード')
  task_list = board.task_lists.create(name: 'テストリスト')
  task = task_list.tasks.create(title: "テストタスク")
end
