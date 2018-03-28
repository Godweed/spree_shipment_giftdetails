Spree::Admin::OrdersController.class_eval do
  def update_shipment_gift_details
    load_order
    shipment = Spree::Shipment.find_by(number: params[:shipment_id])
    success = false
    if shipment.present? && shipment.update_attributes(shipment_params)
      success = true
      flash[:success] = Spree.t(:shipment_updated)
    else
      flash[:error] = Spree.t(:shipment_save_fail)
    end
    @order.update_with_updater! if success
    redirect_back fallback_location: spree.edit_admin_order_url(@order)
  end

  private

  def shipment_params
    params.require(:shipment).permit(
      :giftwrap_id,
      :message_from,
      :message_to,
      :giftmessage
    )
  end
end
