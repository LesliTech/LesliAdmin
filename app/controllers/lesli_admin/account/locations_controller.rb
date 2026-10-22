module LesliAdmin
  class Account::LocationsController < ApplicationController
    before_action :set_account_location, only: %i[ show edit update destroy ]

    # GET /account/locations
    def index
      @account_locations = admin_account.locations
    end

    # GET /account/locations/1
    def show
    end

    # GET /account/locations/new
    def new
      @account_location = admin_account.locations.build
    end

    # GET /account/locations/1/edit
    def edit
    end

    # POST /account/locations
    def create
      @account_location = admin_account.locations.build(account_location_params)

      if @account_location.save
        redirect_to @account_location, notice: "Location was successfully created.", allow_other_host: false
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /account/locations/1
    def update
      if @account_location.update(account_location_params)
        redirect_to @account_location, notice: "Location was successfully updated.", status: :see_other, allow_other_host: false
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /account/locations/1
    def destroy
      @account_location.destroy!
      redirect_to account_locations_path, notice: "Location was successfully destroyed.", status: :see_other
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_account_location
        @account_location = admin_account.locations.find(params.expect(:id))
      end

      def admin_account
        current_user.account.admin
      end

      # Only allow a list of trusted parameters through.
      def account_location_params
        params.fetch(:account_location, {})
      end
  end
end
