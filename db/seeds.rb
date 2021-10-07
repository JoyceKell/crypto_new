# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
  