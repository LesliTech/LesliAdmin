module LesliAdmin
    class SettingsController < ApplicationController
        def show
            @setting = SettingService.new(current_user).show.result
        end

        def update
            attributes = params.require(:setting).permit(:value)
            attributes[:value] = nil if params[:restore_primary_color] == "1"
            service = SettingService.new(current_user).update(attributes)
            @setting = service.result

            if service.successful?
                flash[:notice] = t("lesli_admin.settings.appearance.saved") unless request.format.json?
                # Reload the full page so the layout applies the saved account theme.
                respond_with_lesli(redirect: settings_path, json: { primary_color: @setting.value })
            else
                respond_with_lesli(
                    html: :show,
                    turbo: turbo_stream.replace("account-appearance", partial: "lesli_admin/settings/appearance"),
                    json: { errors: @setting.errors.to_hash },
                    status: :unprocessable_content
                )
            end
        end
    end
end
