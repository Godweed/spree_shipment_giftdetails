Deface::Override.new(
  virtual_path: 'spree/admin/shared/_order_summary',
  name: 'admin_add_giftwrap_total_to_order',
  insert_after: '#order_tab_summary[data-hook] tr:nth-child(2)',
  partial: 'spree/admin/shared/order_summary_giftwrap'
)
