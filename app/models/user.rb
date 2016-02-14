class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  include EmailConfirmable

  has_many :team_users
  has_many :teams, :through => :team_users, :source => :team

  #include TeamConcern

  has_many :reviews

  accepts_nested_attributes_for :teams

  has_many :sent_invitations, :foreign_key => :inviter_id, :class_name => "Invitation"
  has_many :received_invitations, :foreign_key => :invitee_id, :class_name => "Invitation"
  has_many :available_invitations, -> { where(:invitations => { :status => :sent}) }, :foreign_key => :invitee_id, :class_name => "Invitation"


end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
