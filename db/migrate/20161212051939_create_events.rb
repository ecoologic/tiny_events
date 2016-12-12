class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string     :name
      t.text       :description
      t.boolean    :cancelled, default: false, null: false
      t.datetime   :starts_at
      t.datetime   :ends_at
      t.references :venue
    end

    # add_foreign_key :events, :venues # Doesn't work in SQLite
  end
end
