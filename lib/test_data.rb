module TestData
  module TestAddress
    class << self
      def address
        address_hash = {:street => '12582 Cardinal Ave',
                        :city => 'GARDEN GROVE',
                        :zip => '92843',
                        :bedrooms => '4',
                        :bathrooms => '2.0',
                        :sqft => '1317',
                        :lot_size => '10800'}
        return address_hash
      end
    end
  end
end

module Kernel
  def test_address
    TestData::TestAddress
  end
end