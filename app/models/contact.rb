class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true
  validates :message, presence: true
  
  enum status: {
    new_message: 'new',
    read: 'read',
    archived: 'archived'
  }, _default: 'new'
end
