class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      redirect_to contact_path, notice: 'Mesajınız başarıyla gönderildi.'
    else
      redirect_to contact_path, alert: 'Mesaj gönderilemedi. Lütfen tüm alanları doldurun.'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :message)
  end
end 