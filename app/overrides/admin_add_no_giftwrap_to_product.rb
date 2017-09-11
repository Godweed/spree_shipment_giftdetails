Deface::Override.new(
  virtual_path: 'spree/admin/products/_form',
  name: 'admin_add_giftwrap_to_product_form',
  insert_bottom: "[data-hook='admin_product_form_right']",
  partial: 'spree/admin/products/form_giftwrap'
)
