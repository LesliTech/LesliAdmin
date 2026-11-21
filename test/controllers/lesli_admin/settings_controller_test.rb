require "test_helper"

module LesliAdmin
    class SettingsControllerTest < ActionController::TestCase
        class PageController < SettingsController
            skip_before_action :authenticate_request, :authorize_request, raise: false
            skip_after_action :log_requests, raise: false
            skip_before_action :load_announcements
            attr_accessor :current_user

            def self.controller_path
                "lesli_admin/settings"
            end
        end

        tests PageController

        setup do
            @routes = LesliAdmin::Engine.routes
            @account = create_account
            @other_account = create_account
            @controller.current_user = Struct.new(:account, :effective_timezone).new(@account, Time.zone)
        end

        test "updates only the authenticated account and redirects Turbo to reload its theme" do
            other = @other_account.admin.settings.create!(name: "lesli_theme_color_primary", value: "#123456")
            patch :update, params: { setting: { value: "#7C3AED", account_id: @other_account.admin.id, user_id: 5, name: "other" } }, format: :turbo_stream
            assert_response :see_other
            assert_redirected_to "/admin/settings"
            assert_equal "#7C3AED", @account.admin.settings.find_by!(name: "lesli_theme_color_primary", user_id: nil).value
            assert_equal "#123456", other.reload.value
        end

        test "restoring clears the override rather than persisting the default" do
            @account.admin.settings.create!(name: "lesli_theme_color_primary", value: "#123456")
            patch :update, params: { setting: { value: "#7C3AED" }, restore_primary_color: "1" }, format: :json
            assert_response :success
            setting = @account.admin.settings.find_by!(name: "lesli_theme_color_primary")
            assert_nil setting.value
            assert_equal "#194A99", setting.color_input_value
        end

        test "invalid colors return errors without replacing the saved value" do
            setting = @account.admin.settings.create!(name: "lesli_theme_color_primary", value: "#123456")
            patch :update, params: { setting: { value: "invalid" } }, format: :json
            assert_response :unprocessable_content
            assert_equal "#123456", setting.reload.value
            assert @controller.instance_variable_get(:@setting).errors[:value].any?
        end

        test "appearance form uses LesliView and expands short hexadecimal values" do
            setting = @account.admin.settings.new(name: "lesli_theme_color_primary", value: "#abc")
            html = SettingsController.render(partial: "lesli_admin/settings/appearance", assigns: { setting: setting })
            assert_includes html, 'type="color"'
            assert_includes html, 'value="#aabbcc"'
            assert_includes html, 'lesli-form-input'
            assert_includes html, 'data-turbo-frame="_top"'
            assert_includes html, 'name="restore_primary_color"'
        end

        private

        def create_account
            identifier = SecureRandom.hex(6)
            Lesli::Account.insert_all!([{ name: "Theme #{identifier}", email: "#{identifier}@example.com", status: "active", region: "america", created_at: Time.current, updated_at: Time.current }])
            account = Lesli::Account.find_by!(email: "#{identifier}@example.com")
            LesliAdmin::Account.create!(account: account)
            account
        end
    end
end
