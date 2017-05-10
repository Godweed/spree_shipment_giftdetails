Spree::Product.class_eval do
  def giftwrap?
    !no_giftwrap
  end
end
