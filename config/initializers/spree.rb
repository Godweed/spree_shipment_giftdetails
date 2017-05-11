# Giftdetails parameters at checkout
Spree::PermittedAttributes.shipment_attributes.push :giftmessage, :giftwrap_id

# Giftwrap Adjuster
Rails.application.config.spree.adjusters << Spree::Adjustable::Adjuster::Giftwrap

# Init first Giftwrap if not available
Spree::Giftwrap.create!(price: 5, title: "Add Gift Wrapping") unless Spree::Giftwrap.any?
