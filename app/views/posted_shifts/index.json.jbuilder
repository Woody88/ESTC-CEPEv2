json.array!(@posted_shifts) do |posted_shift|
  json.extract! posted_shift, :id, :position, :date, :start_time, :finish_time, :seller_id, :buyer_id, :status
  json.url posted_shift_url(posted_shift, format: :json)
end
