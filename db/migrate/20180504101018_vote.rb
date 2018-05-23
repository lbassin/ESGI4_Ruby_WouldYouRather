class Vote < ActiveRecord::Migration[5.2]
  def change
    create_table(:votes) do |t|
      t.references :question, foreign_key: {on_delete: :cascade}
      t.integer :response_one, default: 0
      t.integer :response_two, default: 0
      t.integer :response_total, default: 0
      t.timestamps
    end
  end
end
