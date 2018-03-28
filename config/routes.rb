Spree::Core::Engine.routes.draw do
  namespace :admin do
    patch 'update_shipment_gift_details' => 'orders#update_shipment_gift_details', as: 'update_shipment_gift_details'
  end
end
