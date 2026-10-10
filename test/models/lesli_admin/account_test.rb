require "test_helper"

module LesliAdmin
    class AccountTest < LesliTesting::ModelTester
        test "belongs to a Lesli account" do
            reflection = LesliAdmin::Account.reflect_on_association(:account)

            assert_not_nil reflection
            assert_equal :belongs_to, reflection.macro
            assert_equal "Lesli::Account", reflection.class_name
        end

        test "has many dashboards" do
            reflection = LesliAdmin::Account.reflect_on_association(:dashboards)

            assert_not_nil reflection
            assert_equal :has_many, reflection.macro
            assert_equal LesliAdmin::Dashboard, reflection.klass
        end

        test "initializes account records after creation" do
            callback = LesliAdmin::Account
                ._create_callbacks
                .find { |registered_callback| registered_callback.filter == :initialize_account }

            assert_not_nil callback
            assert_equal :after, callback.kind
        end
    end
end
