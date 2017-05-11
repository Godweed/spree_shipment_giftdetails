Spree::PermittedAttributes.shipment_attributes.push :giftmessage, :giftwrap_id
Rails.application.config.spree.adjusters << Spree::Adjustable::Adjuster::Giftwrap
