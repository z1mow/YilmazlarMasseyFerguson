module Admin
  class ContactsController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!
    
    def index
      @contacts = Contact.all
    end

    def show
      @contact = Contact.find(params[:id])
    end

    def update
      @contact = Contact.find(params[:id])
      if @contact.update(contact_params)
        redirect_to admin_contact_path(@contact), notice: 'İletişim talebi güncellendi.'
      else
        render :show
      end
    end

    def destroy
      @contact = Contact.find(params[:id])
      @contact.destroy
      redirect_to admin_contacts_path, notice: 'İletişim talebi silindi.'
    end

    private

    def contact_params
      params.require(:contact).permit(:status)
    end
  end
end 