# == Schema Information
#
# Table name: invitations
#
#  id            :integer          not null, primary key
#  code          :string
#  email_address :string
#  team_id       :integer
#  inviter_id    :integer
#  invitee_id    :integer
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class InvitationsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
