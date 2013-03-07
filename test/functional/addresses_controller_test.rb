require 'test_helper'

class AddressesControllerTest < ActionController::TestCase
  # include Nester::TestCase
  # nest :address, :under => :entry
  setup do
    @address = addresses(:one)
    @entry = entries(:one)
    #@address.entry = @entry
    @update = { # according to page 94 of AWDR
      :city => "Los Angeles",
      :street => "Sunset blvd",
      :state => "CA",
      :zip => 24567,
      :address_type_id => 1
    }
  end

  test "should get index" do
    get :index, entry_id: @entry
    assert_response :success
    assert_not_nil assigns(:address)
  end

  test "should get new" do
    get :new, entry_id: @entry
    assert_response :success
  end

  test "should create address" do
    assert_difference('Address.count') do
      #post :create, address: { city: @address.city, state: @address.state, street: @address.street, zip: @address.zip}, entry_id: @entry
      post :create, entry_id: @entry, :address => @update
    end

    assert_redirected_to entry_address_path(@entry,assigns(:address))
  end

  test "should show address" do
    get :show, id: @address, entry_id: @entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @address, entry_id: @entry
    assert_response :success
  end

  test "should update address" do
    put :update, id: @address, entry_id: @entry, :address => @update#:address => @update #address: { city: @address.city, state: @address.state, street: @address.street, zip: @address.zip}, entry_id: @entry
    assert_redirected_to entry_address_path(@entry,assigns(:address))
  end

  test "should not update address" do
    put :update, id: @address, :entry_id => @entry, :address => {:zip => 1}
    assert_response :success
    assert_redirected_to edit_entry_address_path(@entry,assigns(:address))
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete :destroy, id: @address, entry_id: @entry
    end

    assert_redirected_to entry_addresses_path
  end
end
