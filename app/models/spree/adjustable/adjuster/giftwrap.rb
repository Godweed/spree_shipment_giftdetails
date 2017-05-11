module Spree
  module Adjustable
    module Adjuster
      class Giftwrap < Spree::Adjustable::Adjuster::Base
        def update
          giftwrap_total = adjustments.giftwrap.reload.map(&:update!).compact.sum
          update_totals(giftwrap_total)
        end

        private

        def adjustments
          adjustable.try(:all_adjustments) || adjustable.adjustments
        end

        def update_totals(giftwrap_total)
          @totals[:non_taxable_adjustment_total] += giftwrap_total
        end
      end
    end
  end
end
