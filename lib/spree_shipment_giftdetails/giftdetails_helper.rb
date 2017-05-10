module SpreeShipmentGiftdetails
  module GiftdetailsHelper
    def active_giftwrap
      Spree::Giftwrap.first
    end
  end
end
