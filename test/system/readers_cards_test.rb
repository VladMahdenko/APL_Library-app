require "application_system_test_case"

class ReadersCardsTest < ApplicationSystemTestCase
  setup do
    @readers_card = readers_cards(:one)
  end

  test "visiting the index" do
    visit readers_cards_url
    assert_selector "h1", text: "Readers cards"
  end

  test "should create readers card" do
    visit readers_cards_url
    click_on "New readers card"

    click_on "Create Readers card"

    assert_text "Readers card was successfully created"
    click_on "Back"
  end

  test "should update Readers card" do
    visit readers_card_url(@readers_card)
    click_on "Edit this readers card", match: :first

    click_on "Update Readers card"

    assert_text "Readers card was successfully updated"
    click_on "Back"
  end

  test "should destroy Readers card" do
    visit readers_card_url(@readers_card)
    click_on "Destroy this readers card", match: :first

    assert_text "Readers card was successfully destroyed"
  end
end
