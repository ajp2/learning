json.array! @parties do |party|
  json.extract! party, :name
  json.guests party.guests do |guest|
    json.name guest.name
  end
end