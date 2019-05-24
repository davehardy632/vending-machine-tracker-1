require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  before :each do

    @owner = Owner.create!(name: "Sam's Snacks")
    @dons  = @owner.machines.create!(location: "Don's Mixed Drinks")
      @snack_1 = @dons.snacks.create!(name: "Snickers", price: 2.50)
      @snack_2 = @dons.snacks.create!(name: "Chips", price: 2.00)
      @snack_3 = @dons.snacks.create!(name: "Pretzels", price: 2.25)

  end
  scenario 'they see the location of that machine' do


    visit machine_path(@dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it "I see the name of all snack names associated with that machine, and their price" do

      visit machine_path(@dons)

      within(".snacks") do
        expect(page).to have_content(@snack_1.name)
        expect(page).to have_content("Price: #{@snack_1.price}")
        expect(page).to have_content(@snack_2.name)
        expect(page).to have_content("Price: #{@snack_2.price}")
        expect(page).to have_content(@snack_3.name)
        expect(page).to have_content("Price: #{@snack_3.price}")

    end
  end
  it "I see average price of all snacks for the machine" do

    visit machine_path(@dons)

    expect(page).to have_content("Average snack price: $2")
  end
end
