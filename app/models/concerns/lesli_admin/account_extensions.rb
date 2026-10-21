# frozen_string_literal: true

module LesliAdmin
    module AccountExtensions
        extend ActiveSupport::Concern

        included do
            has_one(
                :detail,
                class_name: "LesliAdmin::Account::Detail",
                foreign_key: :account_id,
                inverse_of: :account,
                autosave: true,
                dependent: :destroy
            )

            has_many(
                :admin_locations,
                class_name: "LesliAdmin::Account::Location",
                foreign_key: :account_id,
                inverse_of: :account,
                dependent: :destroy
            )

            accepts_nested_attributes_for :detail, update_only: true
        end
    end
end
