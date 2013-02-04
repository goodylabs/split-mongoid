require 'spec_helper'

describe Split::Mongoid do

  it "should be persistent" do
    user = User.new

    picked = user.ab_test("super_hero", "superman", "spiderman")

    user.split_tests.should eq({"super_hero" => picked})
    user.ab_test("super_hero", "superman", "spiderman").should eq(picked)
  end

  it "should finish" do
    user = User.new
    picked = user.ab_test("super_hero", "superman", "spiderman")
    user.finished("super_hero")
  end

end
