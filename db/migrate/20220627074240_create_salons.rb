class CreateSalons < ActiveRecord::Migration[6.1]
  def change
    create_table :salons, id: :bigint do |t|
      t.string :company_name, :null => false
      t.string :PAN_no, :null => true, index: {unique: true}
      t.string :address
      t.integer :total_chairs, :default => 0
      t.timestamps
    end
  end
end
