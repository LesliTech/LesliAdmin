=begin

Lesli

Copyright (c) 2024, Lesli Technologies, S. A.

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


# · 
require "rails_helper"
require Lesli::RSpec.testers_request 


# · 
RSpec.describe LesliAdmin::AccountsController, type: :request do
    include_context "request user authentication"

    it "is expected to update the account information as a whole" do
        new_account_info = FactoryBot.attributes_for(:lesli_account)

        put("#{LESLI_ADMIN_ENGINE_MOUNTED_PATH}/account.json", params: { account: new_account_info })

        # shared examples
        expect_response_with_successful

        # custom expects
        expect(response_body["id"]).to eq(@current_user.account.id)
        expect(response_body["name"]).to eq(new_account_info[:name])
    end

    it "is expected not to allow empty/null company name" do

        put("#{LESLI_ADMIN_ENGINE_MOUNTED_PATH}/account.json", params: { account: { name: "" }})

        # shared examples
        expect_response_with_error
    end
end
