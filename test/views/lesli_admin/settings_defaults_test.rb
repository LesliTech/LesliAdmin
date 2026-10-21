require "test_helper"

module LesliAdmin
    class SettingsDefaultsTest < ActiveSupport::TestCase
        test "renders configuration without exposing sensitive values" do
            html = LesliAdmin::SettingsController.render(
                partial: "lesli_admin/settings/defaults",
                layout: false
            )

            assert_includes html, "Lesli configuration"
            assert_includes html, "Filtered"
            assert_includes html, "Sensitive values are filtered"
            assert_not_includes html, Lesli.config.security[:password]
        end
    end
end
