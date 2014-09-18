require 'rails_helper'

RSpec.describe Cron, :type => :model do
  describe "initialize" do
    it "raise the exception when invalid string is passed" do
      expect { Cron.new("*****") }.to raise_error
    end

    it "raise the exception when blank string is passed" do
      expect { Cron.new("") }.to raise_error
    end
  end
end
