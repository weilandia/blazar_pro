class CreateRfqs < ActiveRecord::Migration[5.2]
  def change
    create_table :rfqs, id: :uuid do |t|
      t.string :rfq_num
      t.timestamps
    end
  end
end
