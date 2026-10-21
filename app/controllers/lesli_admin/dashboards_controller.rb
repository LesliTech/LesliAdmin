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
    class DashboardsController < Lesli::Shared::DashboardsController
        def show
            @account_summary = AccountService.new(current_user, query).summary

            synchronize_dashboard_components if defined?(LesliDashboard)

            return super if defined?(LesliDashboard)

            render :show
        end

        private

        def synchronize_dashboard_components
            dashboard_account = current_user.account.dashboard
            return unless dashboard_account

            LesliDashboard::DashboardService.new(current_user).register(dashboard_account)

            dashboard = dashboard_account.dashboards.find_by(engine: "LesliAdmin")
            dashboard&.components&.where(component: Dashboard::RETIRED_COMPONENTS)&.destroy_all
        end
    end
end
