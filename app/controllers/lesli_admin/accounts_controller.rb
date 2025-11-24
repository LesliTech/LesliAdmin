=begin

Lesli

Copyright (c) 2025, Lesli Technologies, S. A.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see http://www.gnu.org/licenses/.

Lesli · Ruby on Rails SaaS Development Framework.

Made with ♥ by LesliTech
Building a better future, one line of code at a time.

@contact  hello@lesli.tech
@website  https://www.lesli.tech
@license  GPLv3 http://www.gnu.org/licenses/gpl-3.0.en.html

// · ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~
// · 
=end

module LesliAdmin
    class AccountsController < ApplicationController
        before_action :set_account, only: %i[show update]

        def show
            @account = AccountService.new(current_user, query).show
            respond_to do |format|
                format.html
                format.turbo_stream
                format.json do
                    respond_with_successful(@account)
                end
            end
        end
    
        def update

            # check saved
            if @account.update(account_params)
                respond_with_stream(
                    stream_notification_success('Account updated')
                )
            else 
                #respond_with_error(@account.errors)
            end
        end


        private

        # Use callbacks to share common setup or constraints between actions.
        def set_account
            @account = current_user.account
        end

        # Only allow a list of trusted parameters through.
        def account_params
            params.require(:account).permit(
                :id,
                :name,
                :email,
                detail_attributes: [
                    :company_name_legal, 
                    :company_tagline
                ]
                # :company_name_legal,
                # :company_tagline,
                # :country,
                # :city,
                # :postal_code,
                # :address,
                # :region,
                # :website,
                # :phone_number_1,
                # :public_email,
                # :github,
                # :twitter,
                # :youtube,
                # :linkedin,
                # :facebook,
                # :status,
                # :users_id
            )
        end
    end
end
