json.array!(@shifts) do |shift|
  json.extract! shift, :id, :position, :date, :start_time, :finish_time, :original_owner, :current_owner, :shift_id, :shift_posted

  json.title shift.position
  json.start shift.start_time
  json.end shift.finish_time
  json.id shift.id
  json.url shift_url(shift.id, format: :html)
end
