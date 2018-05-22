class Vote < ActiveRecord::Migration[5.2]
  def change
    create_table(:votes) do |t|
      t.references(:question, foreign_key: true)
      t.integer(:response_one)
      t.integer(:response_two)
      t.integer(:response_total)
      t.timestamps
    end
  end
end
