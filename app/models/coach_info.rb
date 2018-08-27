# == Schema Information
#
# Table name: coach_infos
#
#  id           :bigint(8)        not null, primary key
#  user_id      :bigint(8)
#  birthdate    :datetime
#  region       :string           default(""), not null
#  town         :string           default(""), not null
#  phone        :string           default(""), not null
#  facebook_sn  :string           default(""), not null
#  instagram_sn :string           default(""), not null
#  vk_sn        :string           default(""), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class CoachInfo < ApplicationRecord
  belongs_to :user
end
