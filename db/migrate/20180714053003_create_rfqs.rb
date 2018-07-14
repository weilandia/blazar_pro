class CreateRfqs < ActiveRecord::Migration[5.2]
  def change
    create_table :rfqs, id: :uuid do |t|
      t.string :raw
      t.timestamps
    end
  end
end
