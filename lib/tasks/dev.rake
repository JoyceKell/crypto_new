namespace :dev do
  desc "configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      spinner = TTY::Spinner.new("[:spinner] Loading...")
      spinner.auto_spin
      %x(rails db:drop db:create db:migrate db:seed)
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
      spinner.success('(concluido com sucesso)')

    else 
      puts "Você não está em ambiente de desenvolvimento"
    end
  end

desc "cadastra as moedas"
task add_coins: :environment do
  coins = [ 
    {
      description: "bitcoin",
      acronym: "BTC",
      url_image: "https://logospng.org/download/bitcoin/logo-bitcoin-2048.png"
    },
    {
      description: "Etherium",
      acronym: "ETH",
      url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png"
    },
    {
      description: "Dash",
      acronym: "DASH",
      url_image: "https://www.clipartmax.com/png/middle/96-966205_dash-logo-vector-eps-free-download-logo-icons-clipart-dash-coin-logo.png"
    }
  ]
  coins.each do |coin|
  Coin.find_or_create_by!(coin)
  end
end

desc "cadastra os tipos de mineração"
task add_mining_types: :environment do
  mining_types = [
    {description: "Proof of Work", acronym:"PoW"},
    {description: "Proof of Stake", acronym:"PoS"},
    {description: "Proof of Capacity", acronym:"PoC"}
  ]

  mining_types.each do |mining_type|
    MiningType.find_or_create_by!(mining_type)
  end
end

end

