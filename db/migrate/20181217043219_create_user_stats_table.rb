class CreateUserStatsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :user_stats do |t|
      t.string :user_id
      t.integer :app_launched
      t.datetime :most_active_day_last_7_days
      t.integer :number_of_days_active_last_7_day
      t.string :most_launched_app_last_7_days
    end
  end
end
