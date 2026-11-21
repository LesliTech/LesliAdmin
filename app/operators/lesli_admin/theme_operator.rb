module LesliAdmin
    class ThemeOperator
        def initialize(current_user)
            @current_user = current_user
        end

        def primary_color
            # Join the engine account directly; no account objects need loading.
            Account::Setting.joins(:account).where(
                lesli_admin_accounts: { account_id: @current_user.account_id },
                name: "lesli_theme_color_primary",
                user_id: nil
            ).pick(:value)
        end
    end
end
