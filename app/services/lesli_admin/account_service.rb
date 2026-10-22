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
            account = Lesli::Account
                .includes(:user, admin: :detail)
                .find(current_user.account.id)

            account.admin.build_detail unless account.admin.detail
            account
        end

        def update(attributes)
            account = current_user.account
            account_attributes = attributes.to_h.deep_symbolize_keys
            detail_attributes = account_attributes.delete(:detail_attributes)

            ActiveRecord::Base.transaction do
                account.update!(account_attributes)
                account.admin.update!(detail_attributes: detail_attributes) if detail_attributes
            end

            account
        rescue ActiveRecord::RecordInvalid => exception
            copy_errors(exception.record, to: account)
            false
        end

        def summary
            account = Lesli::Account
                .includes(:user, :users, :roles)
                .find(current_user.account.id)

            {
                account: account,
                users: account.users.size,
                roles: account.roles.size,
                installed_engines: LesliSystem.engines.size
            }
        end

        private

        def copy_errors(source, to:)
            return if source.equal?(to)

            source.errors.each do |error|
                to.errors.add(:detail, error.full_message)
            end
        end
    end 
end
