require 'rails_helper'

RSpec.describe Test, type: :model do
  context "validation tsts" do
    it "ensures title is present" do
      test = Test.new(body: "test content")
      expect(test.valid?).to eq(false)
    end

    it "ensures body is present" do
      test = Test.new(title: "test content")
      expect(test.valid?).to eq(false)
    end

    it "ensures article is active by default" do 
      test = Test.new(title: "test", body: "test")
      expect(test.active?).to eq(false)
    end

    it "should be able to save article" do 
    end  

  end

  context "scope tsts" do 
  end
end
