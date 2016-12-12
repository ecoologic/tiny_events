class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.string   :name
      t.text     :address_info # TODO? NF?
      t.float    :latitude
      t.float    :longitude    # TODO? NF?
    end
  end
end
