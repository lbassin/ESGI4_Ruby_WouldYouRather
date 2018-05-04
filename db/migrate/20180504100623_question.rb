class Question < ActiveRecord::Migration[5.2]
  def change
    create_table(:question) do |t|
      t.string(:label)
      t.string(:response_one)
      t.string(:response_two)
      t.timestamps
    end
  end
end
