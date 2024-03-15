###
#  filter classic matt & john's (crypto) punks dataset
#  to run use:
#
#   $ ruby sandbox/filter.rb  



require 'cocos'

recs = read_csv( "./sandbox/cryptopunks.csv" )
puts "  #{recs.size} records"

aliens = recs.select { |rec| rec['type'] == 'Alien' }
puts "  #{aliens.size} alien records"
pp aliens

apes = recs.select { |rec| rec['type'] == 'Ape' }
puts "  #{apes.size} ape records"
pp apes


puts "bye"