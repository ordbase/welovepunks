

ATTRIBUTES = [
   'backgrounds/background-bitcoin-orange',
   'backgrounds/background-bitcoin-pattern',
   'backgrounds/background-red',
   'backgrounds/background-green',
   'backgrounds/background-dollar-pattern',
   'backgrounds/background-blue',
   'backgrounds/background-euro-pattern',
   'backgrounds/background-aqua',
   'backgrounds/background-classic',
   'backgrounds/background-default',
   'backgrounds/background-rainbow',
   'backgrounds/background-ukraine',
   'backgrounds/background-usa',

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
   
   'accessories/mohawk', 'accessories/mohawk2',
   'accessories/mohawk-purple', 'accessories/mohawk2-purple',
   'accessories/mohawk-red', 'accessories/mohawk2-red',
   'accessories/mohawk-blonde', 'accessories/mohawk2-blonde',
   'accessories/wildhair',
   'accessories/wildhair-blonde',
   'accessories/wildhair-red',
   'accessories/wildhair-purple',
   'accessories/peakspike',
   'accessories/peakspike-blonde',
   'accessories/bob',
   'accessories/bob-blonde',
   'accessories/tophat',
   'accessories/knittedcap',
   'accessories/beanie',
   'accessories/cap',
   'accessories/capforward',
   'accessories/headband',
   'accessories/hoodie',
   'accessories/goldchain',
   'accessories/earring',
   'accessories/clownnose',
   'accessories/clowneyes',
   'accessories/clowneyes-blue',
   'accessories/eyemask',
   'accessories/3dglasses',
   'accessories/skigoogles',
   'accessories/classicshades',
   'accessories/bigshades',
   'accessories/coolshades',
   'accessories/eyepatch',
   'accessories/vr',
   'accessories/goat',
   'accessories/luxuriousbeard',
   'accessories/luxuriousbeard-light',
   'accessories/beard',
   'accessories/beard-light',
   'accessories/chinstrap',
   'accessories/chinstrap-light',
   'accessories/pipe',

    'accessories/cap2',
    'accessories/cap3',
    'accessories/cowboyhat',
    'accessories/wizardhat',
    'accessories/jesterhat',
    'accessories/bubblegum',
    'accessories/bandana',
    'accessories/bandana2',
    'accessories/frenchcap',
    'accessories/crown',

   'accessories/lasereyes-red', 'accessories/lasereyes2-red', 'accessories/lasereyes3-red',
   'accessories/lasereyes-green','accessories/lasereyes2-green', 'accessories/lasereyes3-green',
   'accessories/lasereyes-blue', 'accessories/lasereyes2-blue', 'accessories/lasereyes3-blue',
   'accessories/lasereyes-gold', 'accessories/lasereyes2-gold', 'accessories/lasereyes3-gold',
].reduce( {} ) do |h, name| 
     key = File.basename( name ).downcase.gsub( /[^a-z0-9]/, '' )

     h[ key ] = Image.read( "./attributes/#{name}.png" )
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



