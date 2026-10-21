module LesliAdmin
    class Account::Detail < ApplicationRecord
        belongs_to :account, class_name: "Lesli::Account", inverse_of: :detail

        validates :account_id, uniqueness: true
    end
end
