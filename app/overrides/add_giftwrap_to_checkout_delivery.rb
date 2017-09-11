Deface::Override.new(
  virtual_path: 'spree/checkout/_delivery',
  name: 'add_giftwrap_to_checkout_delivery',
  insert_after: '[data-hook="stock-contents"]',
  partial: 'spree/checkout/delivery_gift_wrap'
)
