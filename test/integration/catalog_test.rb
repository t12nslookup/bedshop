# frozen_string_literal: true

require 'test_helper'

class CatalogTest < ActionDispatch::IntegrationTest
  test 'shop index shows the catalog and its shops' do
    get shops_url

    assert_response :success
    assert_select 'title', 'Shops · Bedshop'
    assert_select 'h1', 'Find your place to rest'
    assert_select 'a', 'Restful Home'
    assert_select 'link[href=?]', 'https://cdn.jsdelivr.net/npm/bootstrap@5.3.9/dist/css/bootstrap.min.css'
    assert_select 'footer', /Two tables, one simple association/
  end

  test 'creating a shop redirects to its detail page' do
    assert_difference('Shop.count') do
      post shops_url, params: { shop: { shop: 'Moonlight Beds' } }
    end

    shop = Shop.find_by!(shop: 'Moonlight Beds')
    assert_redirected_to shop_url(shop)
    follow_redirect!
    assert_select 'h1', 'Moonlight Beds'
  end

  test 'a shop without a name returns the form with validation errors' do
    assert_no_difference('Shop.count') do
      post shops_url, params: { shop: { shop: '' } }
    end

    assert_response :unprocessable_content
    assert_select '.alert-danger'
    assert_select 'input[name="shop[shop]"]'
  end

  test 'a mattress can be assigned to a shop and shown with its association' do
    assert_difference('Mattress.count') do
      post mattresses_url, params: { mattress: { shop_id: shops(:one).shop_id } }
    end

    mattress = Mattress.order(:id).last
    assert_redirected_to mattresses_url
    follow_redirect!
    assert_select 'td', 'Restful Home'
    assert_equal shops(:one), mattress.shop
  end

  test 'a mattress without a shop returns the form with validation errors' do
    assert_no_difference('Mattress.count') do
      post mattresses_url, params: { mattress: { shop_id: '' } }
    end

    assert_response :unprocessable_content
    assert_select '.alert-danger'
    assert_select 'select[name="mattress[shop_id]"]'
  end
end
