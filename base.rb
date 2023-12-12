

ATTRIBUTES = {
   backgrounds: [
     'background-bitcoin-orange',
     'background-bitcoin-pattern',
     'background-red',
     'background-green',
     'background-dollar-pattern',
     'background-blue',
     'background-euro-pattern',
     'background-aqua',
     'background-classic',
     'background-default',
     'background-rainbow',
     'background-ukraine',
     'background-usa',
    ],
    base: [
     'maxibiz',
     'black',
     'default',
     'human1', 
     'human2', 
     'human3', 
     'orange', 
     'pink',   
     'zombie', 
     'orc',  
     'alien',
   ],
   accessories: [
     'mohawk', 'mohawk2',
     'mohawk-purple', 'mohawk2-purple',
     'mohawk-red', 'mohawk2-red',
     'mohawk-blonde', 'mohawk2-blonde',
   'wildhair',
   'wildhair-blonde',
   'wildhair-red',
   'wildhair-purple',
   'peakspike',
   'peakspike-blonde',
   'bob',
   'bob-blonde',
   'tophat',
   'knittedcap',
   'beanie',
   'cap',
   'capforward',
   'headband',
   'hoodie',
   'goldchain',
   'earring',
   'clownnose',
   'clowneyes',
   'clowneyes-blue',
   'eyemask',
   '3dglasses',
   'skigoogles',
   'classicshades',
   'bigshades',
   'coolshades',
   'eyepatch',
   'vr',
   'goat',
   'luxuriousbeard',
   'luxuriousbeard-light',
   'beard',
   'beard-light',
   'chinstrap',
   'chinstrap-light',
   'pipe',

    'cap2',
    'cap3',
    'cowboyhat',
    'wizardhat',
    'jesterhat',
    'bubblegum',
    'bandana',
    'bandana2',
    'frenchcap',
    'crown',

   'lasereyes-red', 'lasereyes2-red', 'lasereyes3-red',
   'lasereyes-green','lasereyes2-green', 'lasereyes3-green',
   'lasereyes-blue', 'lasereyes2-blue', 'lasereyes3-blue',
   'lasereyes-gold', 'lasereyes2-gold', 'lasereyes3-gold',
   ], 
}.reduce( {} ) do |h,(category, names)| 
   names.each do |name| 
     key = File.basename( name ).downcase.gsub( /[^a-z0-9]/, '' )

     ## fix-up file path by category
     path =  category == :base ? name : "#{category}/#{name}"
     
     h[ key ] = Image.read( "./attributes/#{path}.png" )
   end
   h
end


BACKGROUNDS = [
    'background bitcoin orange',
    'background bitcoin pattern', 
    'background red',  
    'background green',  
    'background dollar pattern', 
    'background blue',
    'background euro pattern',
    'background aqua',
    'background classic',
    'background rainbow',
    'background ukraine',
    'background usa',
]




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



