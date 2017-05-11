module Spree
  Order.class_eval do
    money_methods :giftwrap_total

    def giftwrap_amount
      return 0 if !has_giftwrap?
      all_adjustments.nonzero.eligible.giftwrap.map(&:amount).sum
    end

    def giftwrap_total
      Spree::Money.new(giftwrap_amount, currency: currency)
    end

    def has_giftwrap?
      all_adjustments.nonzero.eligible.giftwrap.exists?
    end
  end
end
