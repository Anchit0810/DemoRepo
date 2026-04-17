json.array! @cities do |i|
    json.partial! 'city', city: i
    # json.city i.city_name
    # json.state_name i.state
end
