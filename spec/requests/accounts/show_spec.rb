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
require Lesli::Engine.root.join("spec/support/testers/request")

ENGINE_MOUNTED_PATH ||= LesliAdmin::Engine.routes.find_script_name({})


# · 
RSpec.describe LesliAdmin::AccountsController, type: :request do
    include_context "request user authentication"

    before(:each) do
        @account = FactoryBot.create(:lesli_account)
    end

    it "is expected to have a valid account" do

        get("#{ENGINE_MOUNTED_PATH}/account.json")

        # shared examples
        expect_response_with_successful

        # validate response hash not null and keywords
        expect(response_body).not_to be_nil
        expect(response_body).to be_an(Hash)
        expect(response_body).to have_key("id")
        expect(response_body).to have_key("name")
        expect(response_body).to have_key("email")
        expect(response_body).to have_key("status")
        expect(response_body).to have_key("detail_attributes")
        expect(response_body["detail_attributes"]).to have_key("company_name_legal")
        expect(response_body["detail_attributes"]).to have_key("company_tagline")
        
        # validate keyvalues values
        expect(response_body["id"]).to eq(@current_user.account.id)
        expect(response_body["name"]).to eq(@current_user.account.name)
        expect(response_body["email"]).to eq(@current_user.account.email)
        expect(response_body["status"]).to eq(@current_user.account.status)

    end
end
