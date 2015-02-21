json.array!(@trades) do |trade|
  json.extract! trade, :id, :shift_id, :seller_id, :buyer_id
  json.url trade_url(trade, format: :json)
end
