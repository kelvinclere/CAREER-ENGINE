class CreateUserSchools < ActiveRecord::Migration[7.2]
  def change
    create_table :user_schools do |t|
      t.references :user, null: false, foreign_key: true
      t.references :career, null: false, foreign_key: true

      t.timestamps
    end
  end
end
