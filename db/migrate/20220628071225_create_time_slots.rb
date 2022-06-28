class CreateTimeSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :time_slots do |t|
      t.string :slot, :null => false
    end
  end
end
