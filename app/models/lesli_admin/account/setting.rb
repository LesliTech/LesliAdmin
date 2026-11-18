module LesliAdmin
    class Account::Setting < ApplicationRecord
        validates :value, format: {
            with: /\A#(?:\h{3}|\h{6})\z/,
            message: ->(*) { I18n.t("lesli_admin.settings.appearance.invalid_color") }
        }, allow_blank: true, if: -> { name == "lesli_theme_color_primary" }

        # Native color inputs require six digits; the preview matches LesliAssets primary-700.
        # Restoring the theme saves nil and lets LesliAssets provide the real fallback.
        def color_input_value
            color = value.presence || "#194A99"
            color.length == 4 ? "##{color.delete_prefix('#').chars.map { |digit| digit * 2 }.join}" : color
        end

        belongs_to :account, class_name: "LesliAdmin::Account", inverse_of: :settings
        belongs_to :user, class_name: "Lesli::User", optional: true
    end
end
