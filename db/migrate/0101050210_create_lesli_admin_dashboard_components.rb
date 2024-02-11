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

class CreateLesliAdminDashboardComponents < ActiveRecord::Migration[6.1]
    def change
        gem_path = Lesli::System.engine("Lesli", "dir")
        table_base_structure = JSON.parse(File.read(File.join(gem_path, "db", "structure", "00000502_dashboard_components.json")))
        create_table :lesli_admin_dashboard_components do |t|
            table_base_structure.each do |column|
                t.send(
                    column["type"].parameterize.underscore.to_sym,
                    column["name"].parameterize.underscore.to_sym
                )
            end
            t.timestamps
        end

        add_reference(
            :lesli_admin_dashboard_components, :dashboard, 
            foreign_key: { to_table: :lesli_admin_dashboards }, 
            index: { name: "lesli_admin_dashboard_components_dashboards" }
        )
    end
end