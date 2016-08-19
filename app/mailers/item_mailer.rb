class ItemMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.item_mailer.new_item.subject
  #
  def new_item(item)
    @item = item
    mail(to: @item.user.email, subject: 'Item Adicionado ao MakemyParty!')
  end
end
