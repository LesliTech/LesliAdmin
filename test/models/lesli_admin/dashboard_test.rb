require "test_helper"

module LesliAdmin
    class DashboardTest < ActiveSupport::TestCase
        test "inherits from the shared dashboard" do
            assert_operator LesliAdmin::Dashboard, :<, Lesli::Shared::Dashboard
        end

        test "registers the installed engines component" do
            assert_includes LesliAdmin::Dashboard::COMPONENTS, :installed_engines
        end
    end
end
