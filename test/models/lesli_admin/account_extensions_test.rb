require "test_helper"

module LesliAdmin
    class AccountExtensionsTest < ActiveSupport::TestCase
        setup do
            identifier = SecureRandom.hex(6)
            timestamp = Time.current

            Lesli::Account.insert_all!([{
                name: "Account #{identifier}",
                email: "account-#{identifier}@example.com",
                status: "active",
                region: "america",
                created_at: timestamp,
                updated_at: timestamp
            }])

            @account = Lesli::Account.find_by!(email: "account-#{identifier}@example.com")
            @admin_account = LesliAdmin::Account.create!(account: @account)
        end

        test "keeps the admin profile and locations in the admin account" do
            detail = LesliAdmin::Account.reflect_on_association(:detail)
            locations = LesliAdmin::Account.reflect_on_association(:locations)

            assert_equal "LesliAdmin::Account::Detail", detail.class_name
            assert_equal "LesliAdmin::Account::Location", locations.class_name
        end

        test "creates and updates one company profile through nested attributes" do
            assert_difference(-> { LesliAdmin::Account::Detail.count }, 1) do
                @admin_account.update!(detail_attributes: {
                    company_name: "Example Company",
                    public_email: "hello@example.com"
                })
            end

            assert_no_difference(-> { LesliAdmin::Account::Detail.count }) do
                @admin_account.update!(detail_attributes: {
                    company_name: "Updated Company"
                })
            end

            assert_equal "Updated Company", @admin_account.reload.detail.company_name
        end

        test "account service prepares an empty company profile for the form" do
            current_user = Struct.new(:account).new(@account)

            account = LesliAdmin::AccountService.new(current_user).show

            assert_predicate account.admin.detail, :new_record?
            assert_equal @account.id, account.id
        end

        test "account service updates core and admin attributes together" do
            current_user = Struct.new(:account).new(@account)
            service = LesliAdmin::AccountService.new(current_user)

            result = service.update(
                name: "Updated Account",
                detail_attributes: { company_name: "Example Company" }
            )

            assert_equal @account, result
            assert_equal "Updated Account", @account.reload.name
            assert_equal "Example Company", @admin_account.reload.detail.company_name
        end

        test "account service summarizes dashboard resources" do
            current_user = Struct.new(:account).new(@account)

            summary = LesliAdmin::AccountService.new(current_user).summary

            assert_equal @account, summary[:account]
            assert_equal 0, summary[:users]
            assert_equal 0, summary[:roles]
            assert_equal LesliSystem.engines.size, summary[:installed_engines]
        end
    end
end
