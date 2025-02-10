require "test_helper"

class AgriculturalEquipmentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get agricultural_equipment_index_url
    assert_response :success
  end

  test "should get matris" do
    get agricultural_equipment_matris_url
    assert_response :success
  end

  test "should get alpler" do
    get agricultural_equipment_alpler_url
    assert_response :success
  end
end
