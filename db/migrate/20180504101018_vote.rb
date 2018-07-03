class Vote < ActiveRecord::Migration[5.2]
  def change
    create_table(:votes) do |t|
      t.references :response, foreign_key: {on_delete: :cascade}
      t.timestamps
    end
  end
end
