class Response < ActiveRecord::Migration[5.2]
  def change
    create_table(:responses) do |t|
      t.references :question, foreign_key: {on_delete: :cascade}
      t.string(:label)
      t.timestamps
    end
  end
end
