require "test_helper"

module LesliAdmin
    class EngineTest < ActiveSupport::TestCase
        test "inherits from Rails engine" do
            assert_operator LesliAdmin::Engine, :<, Rails::Engine
        end

        test "isolates the LesliAdmin namespace" do
            assert_equal "LesliAdmin", LesliAdmin::Engine.railtie_namespace.name
        end

        test "defines account and settings resource routes" do
            route_names = LesliAdmin::Engine.routes.routes.filter_map(&:name)

            assert_includes route_names, "account"
            assert_includes route_names, "settings"
        end
    end
end
