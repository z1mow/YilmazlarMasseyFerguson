class Contact < ApplicationRecord
  enum status: {
    'Yeni Mesaj': 'new_message',
    'Okundu': 'read',
    'Arşivlendi': 'archived'
  }

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true
  validates :message, presence: true
end
