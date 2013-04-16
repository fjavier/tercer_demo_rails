# == Schema Information
#
# Table name: microposts
#
#  id         :integer          not null, primary key
#  contenido  :string(255)
#  usuario_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Micropost < ActiveRecord::Base
  attr_accessible :contenido
  belongs_to :usuario
  validates :usuario_id, presence: true
  validates :contenido, presence: true, length: { maximum: 140 }
  default_scope order: 'microposts.created_at DESC'

end
