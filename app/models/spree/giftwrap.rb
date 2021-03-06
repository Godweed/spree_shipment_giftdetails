module Spree
  class Giftwrap < ActiveRecord::Base
    TOTAL_LABEL = Spree.t('giftwrap')

    def amount(currency = 'USD')
      Spree::Money.new(price, currency: currency)
    end

    def compute_amount(order)
      price
    end

    def label(currency = 'USD')
      "#{title} (#{amount(currency)})"
    end
  end
end
