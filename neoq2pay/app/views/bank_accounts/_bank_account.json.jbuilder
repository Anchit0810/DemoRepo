json.extract! bank_account, :id, :user_id , :account_number, :ifsc_code, :bank_name ,:balance,:created_at
json.user bank_account.user.name
json.url bank_account_url(bank_account, format: :json)
