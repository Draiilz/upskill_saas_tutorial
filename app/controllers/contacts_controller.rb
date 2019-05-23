class ContactsController < ApplicationController
  
  
  # GET request to /contact-us 
  # Show new contact form
  def new
    @contact = Contact.new
  end
  
  # POST request  /contacts 
  def create
    # Mass assignment of form fields into Contact object
    @contact = Contact.new(contact_params)
    # Save the Contact object to the database 
    if @contact.save
      # Store form feild via paramaters, into local variables
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      # Plug variables into Contact Mailer 
      # Email method and send email
      ContactMailer.contact_email(name, email, body).deliver
      # Store sucess message in flash hash
      flash[:success] = "Message sent."
      # redirecs to the new action(contact page)
      redirect_to new_contact_path
    else
      # If contact object doesn't save
      # store error in flash hash
      # and redirect to the new action (Contact page)
      flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end  
  end
  
  private
  # To collect data from form, we need to use
  # Strong parameters and whitelist form fields
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end  
end
