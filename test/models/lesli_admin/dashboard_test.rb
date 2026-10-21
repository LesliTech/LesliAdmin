require "test_helper"

module LesliAdmin
    class DashboardTest < ActiveSupport::TestCase
        test "inherits from the shared dashboard" do
            assert_operator LesliAdmin::Dashboard, :<, Lesli::Shared::Dashboard
        end

        test "registers each account metric and metadata component" do
            component_names = LesliAdmin::Dashboard::COMPONENTS.map { |component| component.keys.first }

            assert_equal %i[
                users
                roles
                installed_engines
                account_metadata
            ], component_names

            assert_equal %w[locations currencies settings], LesliAdmin::Dashboard::RETIRED_COMPONENTS
        end
    end
end
