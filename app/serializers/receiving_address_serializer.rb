class ReceivingAddressSerializer < BaseSerializer
  attributes :id, :consignee, :mobile, :province, :city, :district, :street,
             :defaulted
end
