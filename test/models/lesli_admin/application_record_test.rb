require "test_helper"

module LesliAdmin
    class ApplicationRecordTest < ActiveSupport::TestCase
        test "is abstract" do
            assert_predicate LesliAdmin::ApplicationRecord, :abstract_class?
        end
    end
end
