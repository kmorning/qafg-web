class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings, id: :uuid do |t|
      t.string :name
      t.integer :day
      t.time :time
      t.string :location
      t.string :street
      t.string :city
      t.integer :category
      t.text :types, array: true, default: []
      t.text :notes

      t.timestamps
    end
  end
end
