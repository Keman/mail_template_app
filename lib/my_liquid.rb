class MyLiquid
  def self.parse_and_render_mail_text(text, account)
    object = Liquid::Template.parse(text)
    object.render("name" => account.name,
                  "balance" => account.balance,
                  "currency" => account.currency)
  end
end
