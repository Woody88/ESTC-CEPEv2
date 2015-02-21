json.array!(@shifts) do |shift|
  json.extract! shift, :id, :position, :date, :start_stime, :finish_time, :original_owner, :current_owner, :shift_id, :shift_posted

  json.title shift.position
  json.start shift.start_stime
  json.end shift.finish_time
  json.url shift_url(shift, format: :json)
end
