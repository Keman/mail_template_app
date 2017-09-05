class AccountsController < ApplicationController
  before_action :find_account, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = Account.all
  end

  def show
  end

  def new
    @account = Account.new
  end

  def edit
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      flash[:notice] = "Account created"
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @account.update(account_params)
      flash[:notice] = "Account updated"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    flash[:notice] = "Account deleted"
    redirect_to root_path
  end

  private

  def account_params
    params.require(:account).permit(:email, :name, :balance, :currency)
  end

  def find_account
    @account = Account.find(params[:id])
  end
end
