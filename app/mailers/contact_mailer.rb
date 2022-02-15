class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.email_agent.subject
  #
  def email_agent agent_id, first_name, last_name, email, message
    @agent = Account.find(agent_id)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @message = message

    if @agent.present?
        mail to: @agent.email, message: "You have a new contact from Property Finder"
    end
  end
end
