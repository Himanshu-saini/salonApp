class CreateSalons < ActiveRecord::Migration[6.1]
  def change
    create_table :salons do |t|
      t.string :company_name
      t.string :PAN_no
      t.string :address
      t.string :total_chairs
      t.timestamps
    end
  end
end
