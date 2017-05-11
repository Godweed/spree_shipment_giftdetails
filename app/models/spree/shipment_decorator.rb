Spree::Shipment.class_eval do
  alias_method :super_update_adjustments, :update_adjustments
  belongs_to :giftwrap

  def giftwrap_allowed?
    !stock_location.no_giftwrap && !include_no_giftwrap_product?
  end

  def giftwrap_amount
    return 0 if !has_giftwrap?
    adjustments.nonzero.eligible.giftwrap.map(&:amount).sum
  end

  def giftwrap_total
    Spree::Money.new(giftwrap_amount, currency: currency)
  end

  def has_giftwrap?
    adjustments.nonzero.eligible.giftwrap.exists?
  end

  def include_no_giftwrap_product?
    !inventory_units.find { |unit| unit.variant.product.no_giftwrap }.blank?
  end

  private

  def adjust_giftwrap
    if giftwrap.blank?
      adjustments.giftwrap.each(&:delete)
    elsif adjustments.giftwrap.map(&:amount).sum != giftwrap.price
      adjustments.giftwrap.each(&:delete)
      Spree::Adjustment.create!(
        adjustable: self,
        label: Spree::Giftwrap::TOTAL_LABEL,
        order: order,
        source: giftwrap,
        amount: giftwrap.price
      )
    end
  end

  def update_adjustments
    if giftwrap_id_changed? && state != 'shipped'
      adjust_giftwrap
      recalculate_adjustments
    end
    super_update_adjustments
  end
end
