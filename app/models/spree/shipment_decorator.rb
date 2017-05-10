Spree::Shipment.class_eval do
  alias_method :super_final_price, :final_price
  belongs_to :giftwrap

  def add_giftwrap(giftwrap = nil)
    giftwrap = Spree::Giftwrap.first if giftwrap.nil?
    update(giftwrap: giftwrap, giftwrap_price: giftwrap_price)
  end

  def giftwrap?
    !stock_location.no_giftwrap && !include_no_giftwrap_product?
  end

  def include_no_giftwrap_product?
    !inventory_units.find { |unit| unit.variant.product.no_giftwrap }.blank?
  end
end
