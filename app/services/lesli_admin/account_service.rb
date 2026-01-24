=begin

Lesli

Copyright (c) 2023, Lesli Technologies, S. A.

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

Made with ♥ by https://www.lesli.tech
Building a better future, one line of code at a time.

@contact  hello@lesli.tech
@website  https://www.lesli.tech
@license  GPLv3 http://www.gnu.org/licenses/gpl-3.0.en.html

// · ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~     ~·~
// · 
=end

module LesliAdmin 
    class AccountService < Lesli::ApplicationLesliService
        def show 
            account = Lesli::Account #.left_joins(:detail)
            .where(:id => current_user.account.id)
            .select(:id, :email, :name, :status) #, :company_name_legal, :company_tagline)
            .first

            {
                id: account.id,
                name: account.name,
                email: account.email,
                status: account.status,
                # detail_attributes: {
                #     company_name_legal: account.company_name_legal,
                #     company_tagline: account.company_tagline
                # }
            }

            #current_user.account.joins(:detail)
            return account
        end 
    end 
end
