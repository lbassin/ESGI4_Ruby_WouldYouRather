class Vote < ActiveRecord::Migration[5.2]
  def change
    create_table(:votes) do |t|
      t.references :question, foreign_key: {on_delete: :cascade}
      t.integer :response
      t.timestamps
    end
  end
end
