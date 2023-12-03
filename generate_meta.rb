

CATEGORIES = {
  'base' => [
        'maxibiz',
        'black',
        'default',

        'human1', 
        'human2', 
        'human3', 
        'orange', 
        'zombie', 
        'orc',    
        'alien',  
  
        'pink',   
      ],

  ## use for maxibiz/black/default    
  'hair_black' => [
                  'mohawk', 'mohawk2',
                  'wildhair',
                  'peakspike',
                  'bob',     ## exclusive
                ],    
  'hair' => [
        'mohawk',        'mohawk2',
        'mohawk-purple', 'mohawk2-purple',
        'mohawk-red',    'mohawk2-red',
        'mohawk-blonde', 'mohawk2-blonde',
        'wildhair',
        'wildhair-blonde',
        'wildhair-red',
        'wildhair-purple',
        'peakspike',
 
  ],
  ## use for pink (barbie)
  'hair_blonde_f' => [ 
          'mohawk-blonde', 'mohawk2-blonde',
          'peakspike-blonde',     ## exclusive
          'bob-blonde',           ## exclusive
          ['bob-blonde', 'cap'],       ## exclusive
          ['bob-blonde', 'headband'],  ## exclusive
     ],   

  'hat' => [
    'tophat',
    'knittedcap',
    'beanie',
    'capforward',
    'headband',
    'hoodie',
    'cap2',
    'cap3',
    'cowboyhat',
    'wizardhat',
    'jesterhat',
    'bandana',
    'bandana2',
    'crown',
  ],
  'hat_blonde_f' => [
    'knittedcap',
    'beanie',
    'cap',
    'cowboyhat',
    'jesterhat',
    'bandana',
    'hoodie',
    'frenchcap',  # exclusive
    ## no tophat, capforward, headband - why? why not?
  ],
  'lasereyes_black' => [
    'lasereyes-red', 'lasereyes2-red', 
    'lasereyes-green','lasereyes2-green', 
    'lasereyes-blue', 'lasereyes2-blue', 
    'lasereyes-gold', 'lasereyes2-gold', 
  ],
  'lasereyes' => [
    'lasereyes3-red',
    'lasereyes3-green',
    'lasereyes3-gold',
  ],
  'lasereyes_blonde_f' => [
    'lasereyes3-blue',   # exclusive
  ],

  'eyewear' => [
     'eyemask',
     '3dglasses',
     'skigoogles',
     'classicshades',
     'coolshades',   ## exclusive (to non-blondes)
     'eyepatch',    
     'vr',   
     ['clowneyes','clownnose'],
    ],
  'eyewear_blonde_f' => [
    'eyemask',
    '3dglasses',
    'skigoogles',
    'classicshades',
    'eyepatch',    
     'vr',
    ['clowneyes-blue', 'clownnose'],   ## exclusive 
    'bigshades',  ## exclusive
  ], 
  
  'beard_black' => [
    'luxuriousbeard',
    'beard',
    'chinstrap',
  ],
  'beard' => [
   'luxuriousbeard',
   'luxuriousbeard-light',
   'beard',
   'beard-light',
   'chinstrap',
   'chinstrap-light',
   'goat',  
  ],
  'ear_neck' => [
    'earring',
    'goldchain',  
  ],
  'mouth_prop' => [
    'pipe',
    'bubblegum',
  ],
} 


pp CATEGORIES

def random_attributes( base )
  attributes = []

  style  =  if ['maxibiz', 'black', 'default'].include?( base )     ## maxibiz/black/default 
               :black 
            elsif ['pink'].include?( base )  ## pink (barbie)
               :blonde
            elsif  ['alien'].include?( base )  ## alien 
               :alien
            else                       ## "standard" humans incl. orc
               :default
            end

   hair_attributes =  case style
                      when :black then   CATEGORIES['hair_black']
                      when :blonde then  CATEGORIES['hair_blonde_f']
                      else               CATEGORIES['hair']  ## alien # def
                      end

   hat_attributes =   case style
                      when :blonde then  CATEGORIES['hat_blonde_f']
                      else               CATEGORIES['hat'] 
                      end

   eyewear_attributes = case style
                        when :black  then  CATEGORIES['eyewear']+CATEGORIES['lasereyes_black']
                        when :blonde then  CATEGORIES['eyewear_blonde_f']+CATEGORIES['lasereyes_blonde_f']
                        else               CATEGORIES['eyewear']+CATEGORIES['lasereyes']
                        end

   beard_attributes  = case style
                        when :blonde, 
                             :alien  then  nil
                        when :black  then  CATEGORIES['beard_black']
                        else               CATEGORIES['beard'] 
                        end
  
    ear_neck_attributes = case style
                          when :alien   then nil   
                          else               CATEGORIES['ear_neck'] 
                          end

    mouth_prop_attributes = case style
                            when :blonde   then nil   
                            else                CATEGORIES['mouth_prop'] 
                            end

   if beard_attributes
      beard  = rand( 10 )
      ## 30% w/ beard
      if [0,1,2].include?( beard )
        attributes << beard_attributes[ rand( beard_attributes.size ) ]
      else
        ## none; continue
      end
   end

   ##   0,1,2 - hair   (30%)
   ##   3,4,5,6,7,8 - hat (60%)
   ##   9 -none           (10%) 
   hair_dist, hat_dist =  case style 
                          when :blonde then [[3,4,5,6,7,8],[0,1,2]]  ## more hair
                          else              [[3,4,5,6,7,8],[0,1,2]]  # more hats 
                          end
   hair_or_hat  = rand( 10 )
   if hair_dist.include?( hair_or_hat )
      attributes << hair_attributes[ rand( hair_attributes.size ) ]
   elsif hat_dist.include?( hair_or_hat )
      attributes << hat_attributes[ rand( hat_attributes.size ) ]
   else
     ## none; continue
   end


   if ear_neck_attributes
      ear_neck  = rand( 10 )
      ear_neck_dist =  style == :blonde ? [0,1,2,3,4 ] : [0,1]
      if ear_neck_dist.include?( ear_neck )
         attributes << ear_neck_attributes[ rand( ear_neck_attributes.size ) ]
      else
        ## none; continue
      end
  end

  if mouth_prop_attributes
    mouth_prop  = rand( 100 )
    mouth_prop_dist = [0]  # 1%
    if mouth_prop_dist.include?( mouth_prop )
       attributes << mouth_prop_attributes[ rand( mouth_prop_attributes.size ) ]
    else
      ## none; continue
    end
  end

   ## 70% if hair or hat
   ## 90% if no hair or hat
   eyewear  = rand( 10 )
   eyewear_dist =   hair_or_hat == 9 ?  [0,1,2,3,4,5,6,7,8] : [0,1,2,3,4,5,6]
   if eyewear_dist.include?( eyewear )
      attributes << eyewear_attributes[ rand( eyewear_attributes.size ) ]
   else
     ## none; continue
   end


   ## note: might included nested attributes (combos) - flatten
   attributes.flatten
end



def generate_meta( max=1000, seed: 4242 )

  srand( seed )   ## make deterministic

  recs = []

  bases = CATEGORIES['base']
  max.times do |id|
      base        = bases[ id % bases.size ]
      accessories = random_attributes( base )
    
      attributes = [base] + accessories
      print "==> #{id}: "
      pp attributes

    rec = []
    rec << id.to_s   ## add id - starting at one
    rec << base
    rec << accessories.join(' / ')

    recs << rec
  end

  recs
end



recs = generate_meta( 5000 )
pp recs


headers = ['id', 'type', 'accessories']
File.open( "./tmp/welovemonkes.csv", "w:utf-8" ) do |f|
   f.write( headers.join( ', '))
   f.write( "\n")
   recs.each do |values|
     f.write( values.join( ', ' ))
     f.write( "\n" )
   end
end


puts "bye"


