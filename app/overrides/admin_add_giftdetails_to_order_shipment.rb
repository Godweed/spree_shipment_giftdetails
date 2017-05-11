Deface::Override.new(
  virtual_path: 'spree/admin/orders/_shipment',
  name: 'admin_add_giftdetails_to_order_shipment',
  insert_after: '[data-hook="stock-contents"] .show-method.total',
  partial: 'spree/admin/orders/shipment_giftdetails'
)
