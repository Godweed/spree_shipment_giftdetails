module Spree
  OrderUpdater.class_eval do
    alias_method :super_update_shipment_total, :update_shipment_total
    alias_method :super_update_shipment_total, :update_shipment_total

    def apply_giftwrap_adjustment
      order.shipments.each do |shipment|

        binding.pry
        if shipment.giftwrap.blank?
          shipment.adjustments.giftwrap(&:delete)
        elsif shipment.adjustments.giftwrap.map(&:amount).sum != shipment.giftwrap.price
          shipment.adjustments.giftwrap(&:delete)
          Spree::Adjustment.create!(
            adjustable: shipment,
            label: Spree::Giftwrap::TOTAL_LABEL,
            order: order,
            source: shipment.giftwrap,
            amount: shipment.giftwrap.price
          )

          shipment.update(non_taxable_adjustment_total: shipment.giftwrap.price)
          binding.pry
        end
      end
    end

    def update_shipment_total
      apply_giftwrap_adjustment
      super_update_shipment_total
    end
  end
end
