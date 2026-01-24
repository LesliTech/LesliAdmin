module LesliAdmin
  class Account::DetailsController < ApplicationController
    before_action :set_account_detail, only: %i[ show edit update destroy ]

    # GET /account/details
    def index
      @account_details = Account::Detail.all
    end

    # GET /account/details/1
    def show
    end

    # GET /account/details/new
    def new
      @account_detail = Account::Detail.new
    end

    # GET /account/details/1/edit
    def edit
    end

    # POST /account/details
    def create
      @account_detail = Account::Detail.new(account_detail_params)

      if @account_detail.save
        redirect_to @account_detail, notice: "Detail was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /account/details/1
    def update
      if @account_detail.update(account_detail_params)
        redirect_to @account_detail, notice: "Detail was successfully updated.", status: :see_other
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /account/details/1
    def destroy
      @account_detail.destroy!
      redirect_to account_details_path, notice: "Detail was successfully destroyed.", status: :see_other
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_account_detail
        @account_detail = Account::Detail.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def account_detail_params
        params.fetch(:account_detail, {})
      end
  end
end
