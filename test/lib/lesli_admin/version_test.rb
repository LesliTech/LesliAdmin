require "test_helper"

module LesliAdmin
    class VersionTest < ActiveSupport::TestCase
        test "has a version number" do
            assert_predicate LesliAdmin::VERSION, :present?
        end

        test "has a build number" do
            assert_predicate LesliAdmin::BUILD, :present?
        end
    end
end
