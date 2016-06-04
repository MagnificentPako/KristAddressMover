require "krist"

unless ARGV.length == 2
  puts "Dude, not the right number of arguments."
  puts "Usage: ruby mover.rb <old password> <new address>"
  exit
end

password = ARGV[0]
address = ARGV[1]

wallet = KWallet.new(password)

balance = wallet.getInfo["address"]["balance"]

wallet.sendTo(to: address, amount: balance)
puts "Sent #{balance} kst to #{address}"

wallet.getDomains["names"].each do |domain|
  wallet.transferDomain(name: domain["name"], to: address)
  puts "Sent #{domain['name']} to #{address}"
end
