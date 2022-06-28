class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services, id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.string :name, :null => false
      t.float :price, :default => 0
      t.integer :time_taken, :default => 0
      t.timestamps
    end
    add_reference(:services, :salon, after: :id, foreign_key: { on_delete: :nullify, on_update: :cascade })
  end
end
