class RentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rent_mailer.new_rent.subject
  #
  def new_rent(rent)
    @rent = rent
    mail(to: @rent.user.email, subject: 'Sua reserva no MakemyParty!')
  end
end
