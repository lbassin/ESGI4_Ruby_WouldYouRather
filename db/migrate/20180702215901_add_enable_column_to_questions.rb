class AddEnableColumnToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :enabled, :boolean, :default => false
  end
end
