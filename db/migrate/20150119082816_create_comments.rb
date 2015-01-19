class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.references :post, index: true
      t.references :user

      t.timestamps
    end
  end
end
