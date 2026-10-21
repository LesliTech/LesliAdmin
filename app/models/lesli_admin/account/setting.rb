module LesliAdmin
    class Account::Setting < ApplicationRecord
        belongs_to :account, class_name: "LesliAdmin::Account", inverse_of: :settings
        belongs_to :user, class_name: "Lesli::User", optional: true
    end
end
