class CreateWeekDays < ActiveRecord::Migration[6.1]
  def change
    create_table :week_days do |t|
      t.string :name, :null => false
    end
  end
end
