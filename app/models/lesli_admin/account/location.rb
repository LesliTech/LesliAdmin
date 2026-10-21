module LesliAdmin
    class Account::Location < ApplicationRecord
        belongs_to :account, class_name: "Lesli::Account", inverse_of: :admin_locations
        belongs_to :parent, class_name: "LesliAdmin::Account::Location", optional: true

        has_many(
            :children,
            class_name: "LesliAdmin::Account::Location",
            foreign_key: :parent_id,
            inverse_of: :parent,
            dependent: :nullify
        )
    end
end
