module LesliAdmin
    class SettingService < Lesli::ApplicationLesliService
        def show
            response(current_user.account.admin.settings.find_or_initialize_by(
                name: "lesli_theme_color_primary",
                user_id: nil
            ))
        end

        def update(attributes)
            show
            resource.update!(attributes)
            response(resource)
        rescue ActiveRecord::RecordInvalid
            resource.errors.full_messages.each { |message| error(message) }
            response(resource)
        end
    end
end
