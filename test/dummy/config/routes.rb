Rails.application.routes.draw do
    mount Lesli::Engine => "/lesli"
    mount LesliAdmin::Engine => "/lesli_admin"
end
