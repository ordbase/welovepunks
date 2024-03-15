

ATTRIBUTES = {
   backgrounds: [
     'bitcoin-orange',
     'bitcoin-pattern',
     'red',
     'green',
     'dollar-pattern',
     'blue',
     'euro-pattern',
     'aqua',
     'classic',
     'default',
     'rainbow',
     'ukraine',
     'usa',
    ],
    base: [
     'maxibiz',
     'black',
     'default',
     'dark', 
     'light', 
     'albino', 
     'orange', 
     'pink',   
     'zombie', 
     'orc',  
     'alien',
     'joe',
     'donald',
     'ape',
     'ape-golden',
   ],
   accessories: [
     'bubblegum',
     'clownnose',
     'earring',
     'goldchain',
     'hoodie',
     'hoodiedark',
     'hoodielight',
     'headphone',
     'headphone2',
     'pipe',
     'vape',
     'cigarette',
     'medicalmask',
     'medicalmask2',
     'mole',
     'purplelipstick',
   ],
   beard: [
   'beard-light',
   'beard',
   'chinstrap-light',
   'chinstrap',
   'goat',
   'luxuriousbeard-light',
   'luxuriousbeard',
   ],
   eyes: [
   '3dglasses',
   'bigshades',
   'bigshades-green',
   'smallshades',
   'regularshades',
   'modernshades',
   'hornedrimglasses',
   'nerdglasses',
   'classicshades',
   'clowneyes-blue',
   'clowneyes',
   'coolshades',
   'eyemask',
   'eyepatch',
   'polarizedshades',
   'vr',
   ],
   hair: [
      'bob',
      'bob-blonde',
      'bob2-blonde',
      'bob2-pink',
   'longhair',
   'longhair-blonde',
   'longhair-pink',
   'mohawk-blonde',
   'mohawk-purple',
   'mohawk-red',
   'mohawk',
   'mohawk2-blonde',
   'mohawk2-purple',
   'mohawk2-red',
   'mohawk2',
   'peakspike-blonde',
   'peakspike',
   'wildhair-blonde',
   'wildhair-purple',
   'wildhair-red',
   'wildhair',
   ],
   head: [
   'bandana',
   'bandana2',
   'bandana3',
   'beanie',
   'cap-mcb',
   'cap-mcd',
   'cap-small',
   'cap',
   'cap-blue',
   'cap-red',
   'capforward',
   'policecap',
   'cowboyhat',
   'crown',
   'frenchcap',
   'headband',
   'headband-ii',
   'headband2',
   'jesterhat',
   'knittedcap',
   'fedora',
   'classichat',
   'tophat',
   'wizardhat',
   'do-rag',
   'do-rag-blue',
   'do-rag-red',
   ],
   lasereyes: [
   'lasereyes-blue',
   'lasereyes-gold',
   'lasereyes-green',
   'lasereyes-red',
   'lasereyes2-blue',
   'lasereyes2-gold',
   'lasereyes2-green',
   'lasereyes2-red',
   'lasereyes3-blue',
   'lasereyes3-gold',
   'lasereyes3-green',
   'lasereyes3-red',
   ], 
}.reduce( {} ) do |h,(category, names)| 
   names.each do |name| 
     key = File.basename( name ).downcase.gsub( /[^a-z0-9]/, '' )

     ## fix-up names by category 
     key = "bg#{key}"    if category == :backgrounds

     ## fix-up file path by category
     path =  category == :base ? name : "#{category}/#{name}"
     
     h[ key ] = Image.read( "./attributes/#{path}.png" )
   end
   h
end




def generate( *attributes )
   base = Image.new( 24,24 )
   attributes.each do |attrib|
        key = attrib.downcase.gsub( /[^a-z0-9]/, '' )
        img = ATTRIBUTES[ key ]
        if img.nil?
           puts "!! #{attrib} with key #{key} not found; sorry"
           exit 1
        end
        base.compose!( img )
   end
   base
end



