json.array!(@profiles) do |profile|
  json.extract! profile, :id, :fname, :lname, :qualifications, :location, :about, :user
  json.url profile_url(profile, format: :json)
end
