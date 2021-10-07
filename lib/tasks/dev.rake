namespace :dev do
  desc "configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      spinner = TTY::Spinner.new("[:spinner] Loading...")
      spinner.auto_spin
      %x(rails db:drop db:create db:migrate db:seed)
      spinner.success('(concluido com sucesso)')
    else 
      puts "Você não está em ambiente de desenvolvimento"
    end
  end


end
