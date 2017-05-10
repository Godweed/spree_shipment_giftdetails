Spree::OrderUpdater.class_eval do
  alias_method :super_update_shipment_total, :update_shipment_total

  def apply_giftwrap_adjustment
    giftwrap_adjustment_amount = order.shipments.map do |shipment|
      unless shipment.giftwrap.blank?
        shipment.giftwrap.price
      end.to_f
    end.sum
    giftwrap_adjustment = Spree::Adjustment.find_by(adjustment_order_details)
    giftwrap_adjustment.delete if !giftwrap_adjustment.blank? && giftwrap_adjustment.amount != giftwrap_adjustment_amount

    Spree::Adjustment.where(adjustment_order_details).first_or_create adjustment_order_details.merge(amount: giftwrap_adjustment_amount)
  end

  def adjustment_order_details
    {
      adjustable: order,
      order: order,
      label: Spree::Giftwrap::TOTAL_LABEL
    }
  end

  def remove_unused_giftwrap_adjustments
    Spree::Adjustment.where(adjustment_order_details).where.not(source_id: order.shipments.pluck(:id)).each(&:delete)
  end

  def update_shipment_total
    apply_giftwrap_adjustment
    super_update_shipment_total
  end
end
