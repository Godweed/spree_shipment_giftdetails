module Spree
  StockLocation.class_eval do
    def giftwrap?
      !no_giftwrap
    end
  end
end
