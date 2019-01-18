class TicketMailer < ApplicationMailer\
    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.user_mailer.account_activation.subject
    #
    def new_ticket(ticket, user)
        @ticket = ticket
        @user = user
        mail to: user.email, subject: "[Bordz] Ticket ##{ticket.id} Created - #{ticket.project.name} Project"
    end
end
