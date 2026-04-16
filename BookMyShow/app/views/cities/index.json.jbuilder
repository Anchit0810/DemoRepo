json.array! @cities do |i|
    json.partial! 'city', city: i
end
