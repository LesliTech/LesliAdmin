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
    class AboutsController < ApplicationController
        before_action :set_account, only: %i[]

        def show
            respond_to do |format|
                format.html {
                    @lesli_engines = LesliSystem.engines.map do |engine, engine_info|
                        {
                            :name => engine_info[:name],
                            :code => engine_info[:code],
                            :path => engine_info[:path],
                            :build => engine_info[:build],
                            :version => engine_info[:version],
                            :description => engine_info[:description]
                        }
                    end
                }
            end
        end
    end
end
