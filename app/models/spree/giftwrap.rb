module Spree
  class Giftwrap < ActiveRecord::Base
    TOTAL_LABEL = Spree.t('giftwrap.total_label')

    def amount(currency = 'USD')
      Spree::Money.new(price, currency: currency)
    end

    def label(currency = 'USD')
      "#{title} (#{amount(currency)})"
    end
  end
end
