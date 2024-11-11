class CreateCareers < ActiveRecord::Migration[7.2]
  def change
    create_table :careers do |t|
      t.string :title

      t.timestamps
    end
  end
end
