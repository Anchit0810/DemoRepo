json.array! @theaters do |i|
    json.partial! 'theater' , theater: i 
end