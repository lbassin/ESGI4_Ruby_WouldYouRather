class Vote < ActiveRecord::Migration[5.2]
  def change
    create_table(:vote) do |t|
      t.string(:label)
      t.references(:question, foreign_key: true)
      t.integer(:choice)
      t.timestamps
    end
  end
end
