module LesliAdmin
    class Account::Detail < ApplicationRecord
        belongs_to :account, class_name: "LesliAdmin::Account", inverse_of: :detail

        validates :account_id, uniqueness: true
    end
end
