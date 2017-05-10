module Spree
  Adjustment.class_eval do
    scope :giftwrap, -> { where(source_type: 'Spree::Giftwrap') }
  end
end
