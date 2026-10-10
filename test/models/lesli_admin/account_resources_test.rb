require "test_helper"

module LesliAdmin
    class AccountResourcesTest < ActiveSupport::TestCase
        test "uses the expected account resource tables" do
            assert_equal "lesli_admin_account_currencies", LesliAdmin::Account::Currency.table_name
            assert_equal "lesli_admin_account_details", LesliAdmin::Account::Detail.table_name
            assert_equal "lesli_admin_account_locations", LesliAdmin::Account::Location.table_name
            assert_equal "lesli_admin_account_settings", LesliAdmin::Account::Setting.table_name
        end
    end
end
