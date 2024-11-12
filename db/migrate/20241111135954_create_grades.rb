class CreateGrades < ActiveRecord::Migration[7.2]
  def change
    create_table :grades do |t|
      t.references :user, null: false, foreign_key: true
      t.string :subject
      t.string :grade

      t.timestamps
    end
  end
end
