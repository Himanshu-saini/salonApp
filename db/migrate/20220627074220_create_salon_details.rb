class CreateSalonDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :salon_details do |t|

      t.timestamps
    end
  end
end
