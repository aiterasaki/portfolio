# == Schema Information
#
# Table name: products

    # t.string "brand"
    # t.text "detail"
    # t.integer "status"
    # t.integer "burden_of_shipping_fee"
    # t.integer "shipping_method"
    # t.integer "region_id"
    # t.integer "estimated_shipping_date"
    # t.integer "price"
    # t.boolean "sell_flg", default: true, null: false
    # t.string "name"
    # t.string "thumbnail_id"
    # t.integer "productable_id"
    # t.string "productable_type"


#
#  id            :integer          not null, primary key
#  code          :string(10)       not null              # 商品コード
#  name          :string(50)       not null              # 商品名
#  name_kana     :string(50)       default(""), not null # 商品名カナ
#  price         :integer          not null              # 商品価格
#  burden_of_shipping_fee :integer          not null              # 仕入原価
#  sell_flg  :boolean          not null              # 販売可能フラグ
#  created_at    :datetime
#  updated_at    :datetime
#

class Search::Product < Search::Base
  ATTRIBUTES = %i(
    brand
    detail
    price_from price_to
    burden_of_shipping_fee_from burden_of_shipping_fee_to
    sell_flg
  )
  attr_accessor(*ATTRIBUTES)

  def matches
    t = ::Product.arel_table
    results = ::Product.all
    results = results.where(contains(t[:brand], brand)) if brand.present?
    results = results.where(contains(t[:name], name)) if name.present?
    results = results.where(t[:price].gteq(price_from)) if price_from.present?
    results = results.where(t[:price].lteq(price_to)) if price_to.present?
    if burden_of_shipping_fee_from.present?
      results = results.where(t[:burden_of_shipping_fee].gteq(burden_of_shipping_fee_from))
    end
    if burden_of_shipping_fee_to.present?
      results = results.where(t[:burden_of_shipping_fee].lteq(burden_of_shipping_fee_to))
    end
    results = results.where(sell_flg: true) if value_to_boolean(sell_flg)
    results
  end
end
