require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end
  describe "relationships" do
    it {should have_many :snack_machines}
    it {should have_many(:snacks).through(:snack_machines)}
  end

  describe "instance methods" do
      before :each do
        @owner = Owner.create!(name: "Sam's Snacks")
        @dons  = @owner.machines.create!(location: "Don's Mixed Drinks")
          @snack_1 = @dons.snacks.create!(name: "Snickers", price: 2.50)
          @snack_2 = @dons.snacks.create!(name: "Chips", price: 2.00)
          @snack_3 = @dons.snacks.create!(name: "Pretzels", price: 2.25)
      end
      it "average_snack_price" do

        expect(@dons.average_snack_price).to eq(2)
      end
    end
  end
