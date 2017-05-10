Deface::Override.new(
  virtual_path: 'spree/admin/stock_locations/_form',
  name: 'admin_add_giftwrap_to_stock_location_form',
  insert_bottom: '[data-hook="stock_location_status"]',
  partial: 'spree/admin/stock_locations/form_giftwrap'
)
