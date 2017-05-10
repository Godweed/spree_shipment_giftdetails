Deface::Override.new(
  virtual_path: 'spree/admin/products/_form',
  name: 'admin_add_giftwrap_to_product_form',
  insert_after: '[data-hook="admin_product_form_discontinue_on"]',
  partial: 'spree/admin/products/form_giftwrap'
)
