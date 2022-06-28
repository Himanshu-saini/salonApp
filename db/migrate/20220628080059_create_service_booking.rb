class CreateServiceBooking < ActiveRecord::Migration[6.1]
  def change
    create_table :service_bookings do |t|
      t.string :customer_name
      t.string :mobile
      t.integer :status, :limit => 1, :default => 1
      t.timestamps
    end
    add_reference(:service_bookings, :work_schedule, after: :mobile, foreign_key: { on_delete: :nullify, on_update: :cascade })
    add_reference(:service_bookings, :service, after: :mobile, foreign_key: { on_delete: :nullify, on_update: :cascade })
  end
end
