class CreateWorkSchedule < ActiveRecord::Migration[6.1]
  def change
    create_table :work_schedules do |t|
      t.timestamps
    end
    add_reference(:work_schedules, :time_slot, after: :id, foreign_key: { on_delete: :nullify, on_update: :cascade })
    add_reference(:work_schedules, :week_day, after: :id, foreign_key: { on_delete: :nullify, on_update: :cascade })
    add_reference(:work_schedules, :salon, after: :id, foreign_key: { on_delete: :nullify, on_update: :cascade })
  end
end
