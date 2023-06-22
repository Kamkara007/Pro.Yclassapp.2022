class AddAmbassadorReferralCodeToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :ambassador_referral_code, :string
  end
end
