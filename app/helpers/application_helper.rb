module ApplicationHelper
  def date_br(date_us)
    date_us.strftime("%d/%m/%y")
  end

  def locale(locale)
    I18n.locale == :en ? "Estados Unidos" : "Português do Brasil"
  end
end
