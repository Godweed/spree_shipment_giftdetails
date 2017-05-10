Spree::Shipment.class_eval do
  belongs_to :giftwrap

  def add_giftwrap(giftwrap = nil)
    giftwrap = Spree::Giftwrap.first if giftwrap.nil?
    update(giftwrap: giftwrap, giftwrap_price: giftwrap_price)
  end

  def giftwrap?
    !stock_location.no_giftwrap
  end
end
