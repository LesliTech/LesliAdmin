module LesliAdmin
    class Account::Currency < ApplicationRecord
        belongs_to :account, class_name: "LesliAdmin::Account", inverse_of: :currencies
        belongs_to :user, class_name: "Lesli::User", optional: true
    end
end
