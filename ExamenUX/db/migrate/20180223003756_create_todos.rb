class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.references :category, foreign_key: true
      t.string :description
      t.integer :level

      t.timestamps
    end
  end
end
