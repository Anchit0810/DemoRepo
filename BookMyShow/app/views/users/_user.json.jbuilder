json.extract! user #,   :user_name, :user_email, :role, :user_number, :active 
json.userID user.id 
json.name user.user_name
json.email user.user_email
json.mobile_no user.user_number
json.user_type user.role
json.acive user.active