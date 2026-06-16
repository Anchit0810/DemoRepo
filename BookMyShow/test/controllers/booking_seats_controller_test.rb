require "test_helper"

class BookingSeatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_seat = booking_seats(:one)
  end

  test "should get index" do
    get booking_seats_url, as: :json
    assert_response :success
  end

  test "should create booking_seat" do
    assert_difference("BookingSeat.count") do
      post booking_seats_url, params: { booking_seat: {} }, as: :json
    end

    assert_response :created
  end

  test "should show booking_seat" do
    get booking_seat_url(@booking_seat), as: :json
    assert_response :success
  end

  test "should update booking_seat" do
    patch booking_seat_url(@booking_seat), params: { booking_seat: {} }, as: :json
    assert_response :success
  end

  test "should destroy booking_seat" do
    assert_difference("BookingSeat.count", -1) do
      delete booking_seat_url(@booking_seat), as: :json
    end

    assert_response :no_content
  end
end
