# json.ABCD @user.user_name
json.array! @users do |i|
    json.partial! 'user', user: i 
end
 
 