require 'rails_helper'

RSpec.describe "Snack show page" do
  before :each do
    @owner = Owner.create!(name: "Sam's Snacks")
    @dons  = @owner.machines.create!(location: "Don's Mixed Drinks")
      @snack_1 = @dons.snacks.create!(name: "Snickers", price: 2.50)
    @teds  = @owner.machines.create!(location: "Ted's Mixed Drinks")

    @snack_2 = Snack.create!(name: "Chips", price: 2.00)
    @snack_3 = Snack.create!(name: "cookies", price: 3.00)
    @snack_4 = Snack.create!(name: "peanuts", price: 5.00)

    @teds.snacks << @snack_1
    @teds.snacks << @snack_3
    @teds.snacks << @snack_4
  end
  it "I see the name of the snack, list of locations with vending machines that carry it, average price for snacks in those machines, count of different items" do

    visit snack_path(@snack_1)

    expect(page).to have_content(@snack_1.name)
    expect(page).to have_content(@dons.location)
    expect(page).to have_content(@dons.average_snack_price)
    expect(page).to have_content(@dons.item_count)
    expect(page).to have_content(@teds.location)
    expect(page).to have_content(@teds.average_snack_price)
    expect(page).to have_content(@teds.item_count)
  end
end
