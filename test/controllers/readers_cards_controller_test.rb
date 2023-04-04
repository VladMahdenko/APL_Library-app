require "test_helper"

class ReadersCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @readers_card = readers_cards(:one)
  end

  test "should get index" do
    get readers_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_readers_card_url
    assert_response :success
  end

  test "should create readers_card" do
    assert_difference("ReadersCard.count") do
      post readers_cards_url, params: { readers_card: { issue_date: @readers_card.issue_date,
                                                        library_id: @readers_card.library_id } }
    end

    assert_redirected_to readers_card_url(ReadersCard.last)
  end

  test "should show readers_card" do
    get readers_card_url(@readers_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_readers_card_url(@readers_card)
    assert_response :success
  end

  test "should update readers_card" do
    patch readers_card_url(@readers_card), params: { readers_card: { issue_date: @readers_card.issue_date,
                                                                     library_id: @readers_card.library_id } }
    assert_redirected_to readers_card_url(@readers_card)
  end

  test "should destroy readers_card" do
    assert_difference("ReadersCard.count", -1) do
      delete readers_card_url(@readers_card)
    end

    assert_redirected_to readers_cards_url
  end
end
