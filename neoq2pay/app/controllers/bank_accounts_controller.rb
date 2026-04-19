class BankAccountsController < ApplicationController
  before_action :set_bank_account, only: %i[ show update destroy ]

  # GET /bank_accounts
  # GET /bank_accounts.json
  def index
    @bank_accounts = BankAccount.all

    render json: @bank_accounts 
  end

  # GET /bank_accounts/1
  # GET /bank_accounts/1.json
  def show
    render: @bank_accounts
  end

  # POST /bank_accounts
  # POST /bank_accounts.json
  def create
    @bank_account = BankAccount.new(bank_account_params)

    if @bank_account.save
      render json: @bank_account :show, status: :created, location: @bank_account
    else
      render json: @bank_account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bank_accounts/1
  # PATCH/PUT /bank_accounts/1.json
  def update
    if @bank_account.update(bank_account_params)
      render json: @bank_account
    else
      render json: @bank_account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bank_accounts/1
  # DELETE /bank_accounts/1.json
  def destroy
    @bank_account.destroy!
  end

  def add_money
    @bank_account.add_money(params[:amount], params[:remarks])
  end

  def withdraw_money
    @bank_account.withdraw_money(params[:amount], params[:remarks])
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_account
      @bank_account = BankAccount.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def bank_account_params
      params.fetch(:bank_account, {})
    end
    
    def bank_account_params
      params.require(:bank_account).permit(:user_id , :account_number , :ifsc_code , :bank_name , :balance)
    end
end
