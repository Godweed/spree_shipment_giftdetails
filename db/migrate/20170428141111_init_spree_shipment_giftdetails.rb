class InitSpreeShipmentGiftdetails < ActiveRecord::Migration[4.2]
  def change
    create_table :spree_giftwraps, force: :cascade do |t|
      t.string   "title"
      t.decimal  "price", precision: 10, scale: 2, null: false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_column :spree_shipments, :giftwrap_id, :integer, null: true
    add_column :spree_shipments, :giftmessage, :text, null: false, default: ''
    add_column :spree_shipments, :message_to, :string, null: false, default: ''
    add_column :spree_shipments, :message_from, :string, null: false, default: ''

    if Spree::Giftwrap.all.blank?
      Spree::Giftwrap.create(
        title: 'Add Gift Wrapping',
        price: 5.0
      )
    end

    add_column :spree_stock_locations, :no_giftwrap, :boolean, default: false
    add_column :spree_products, :no_giftwrap, :boolean, default: false
  end
end
