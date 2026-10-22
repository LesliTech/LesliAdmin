require "test_helper"

module LesliAdmin
    class AccountResourcesTest < ActiveSupport::TestCase
        test "uses the expected account resource tables" do
            assert_equal "lesli_admin_account_currencies", LesliAdmin::Account::Currency.table_name
            assert_equal "lesli_admin_account_details", LesliAdmin::Account::Detail.table_name
            assert_equal "lesli_admin_account_locations", LesliAdmin::Account::Location.table_name
            assert_equal "lesli_admin_account_settings", LesliAdmin::Account::Setting.table_name
        end

        test "connects account resources to their owning account" do
            assert_equal "LesliAdmin::Account", LesliAdmin::Account::Detail.reflect_on_association(:account).class_name
            assert_equal "LesliAdmin::Account", LesliAdmin::Account::Location.reflect_on_association(:account).class_name
            assert_equal "LesliAdmin::Account", LesliAdmin::Account::Currency.reflect_on_association(:account).class_name
            assert_equal "LesliAdmin::Account", LesliAdmin::Account::Setting.reflect_on_association(:account).class_name
        end
    end
end
