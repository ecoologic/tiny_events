class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string   :name
      t.text     :description
      t.boolean  :cancelled, default: false, null: false
      t.datetime :starts_at
      t.datetime :ends_at
    end
  end
end
