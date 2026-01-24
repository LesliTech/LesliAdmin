module LesliAdmin
  class Account::CurrenciesController < ApplicationController
    before_action :set_account_currency, only: %i[ show edit update destroy ]

    # GET /account/currencies
    def index
      @account_currencies = Account::Currency.all
    end

    # GET /account/currencies/1
    def show
    end

    # GET /account/currencies/new
    def new
      @account_currency = Account::Currency.new
    end

    # GET /account/currencies/1/edit
    def edit
    end

    # POST /account/currencies
    def create
      @account_currency = Account::Currency.new(account_currency_params)

      if @account_currency.save
        redirect_to @account_currency, notice: "Currency was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /account/currencies/1
    def update
      if @account_currency.update(account_currency_params)
        redirect_to @account_currency, notice: "Currency was successfully updated.", status: :see_other
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /account/currencies/1
    def destroy
      @account_currency.destroy!
      redirect_to account_currencies_path, notice: "Currency was successfully destroyed.", status: :see_other
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_account_currency
        @account_currency = Account::Currency.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def account_currency_params
        params.fetch(:account_currency, {})
      end
  end
end
