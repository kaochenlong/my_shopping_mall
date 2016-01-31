class Order < ActiveRecord::Base
  has_many :order_items

  state_machine :initial => :pending do

    event :confirm do
      transition :pending => :confirmed
    end

    event :ship do
      transition :confirmed => :shipping
    end

    event :deliver do
      transition :shipping => :delivered
    end

    event :refund do
      transition :confirm => :refunded
    end

    event :complain_shipping do
      transition :shipping => :complained
    end

    event :complain_deliver do
      transition :delivered => :complained
    end
  end

end

