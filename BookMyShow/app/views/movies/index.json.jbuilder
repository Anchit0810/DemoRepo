json.array! @movie do |i|
    json.partial! 'movie',  movie: i
end
