class Admin::ContactsController < ApplicationController
  def index
    @contacts = Contact.all.order(created_at: :desc)
  end

  def show
    @contact = Contact.find(params[:id])
    @contact.update(status: :read) if @contact.new_message?
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to admin_contacts_path, notice: 'Durum güncellendi.'
    else
      redirect_to admin_contact_path(@contact), alert: 'Güncelleme başarısız oldu.'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to admin_contacts_path, notice: 'Mesaj silindi.'
  end

  private

  def contact_params
    params.require(:contact).permit(:status)
  end
end 