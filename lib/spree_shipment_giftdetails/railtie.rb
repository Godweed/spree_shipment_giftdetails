require 'spree_shipment_giftdetails/giftdetails_helper'

module SpreeShipmentGiftdetails
  class Railtie < Rails::Railtie
    initializer "spree_shipment_giftdetails.giftdetails_helper" do
      ActionView::Base.send :include, GiftdetailsHelper
    end
  end
end
