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

require 'spec_helper'

describe Micropost do
  pending "add some examples to (or delete) #{__FILE__}"
end
