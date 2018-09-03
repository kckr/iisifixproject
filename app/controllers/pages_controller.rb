class PagesController < ApplicationController
  layout 'static'
  layout 'master', only: [:home]

  def home
    @latest_garages = Garage.order(created_at: :desc).limit(10)
  end

  def about
  end

  def contact
    @contact = Contact.new
  end

  def create_contact
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.notify_admin(@contact.id).deliver_now
      flash[:notice] = t('.notice')
      redirect_to root_path
    else
      flash.now[:alert] = t('.alert')
      render 'contact'
    end
  end

  def how_it_works
  end

  def privacy_policy
  end

  def create_new_garage
    @new_garage = NewGarage.new(new_garage_params)
    if @new_garage.save
      NewGarageMailer.notify_admin(@new_garage.id).deliver_now
      flash[:notice] = "The New Garage has been noted and will be added once verified by the admin. Thank you!"
      redirect_to root_path
    else
      flash.now[:alert] = "Something went wrong"
      redirect_to root_path
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :subject, :body)
  end

  def new_garage_params
    params.require(:new_garage).permit(:name, :email, :description)
  end

end
