require 'pixelart'


require_relative 'base'



specs = parse_data( <<DATA )
 ## archetypes
  maxibiz 
  black
  default
  human1
  human2
  human3
  orange
  pink
  zombie
  orc
  alien

  maxibiz, mohawk
  black, mohawk
  default, mohawk
  human1, mohawk
  human2, mohawk
  human3, mohawk
  orange, mohawk red
  pink, mohawk blonde, earring
  zombie, mohawk red
  orc, mohawk purple
  alien, mohawk purple

  maxibiz, top hat, earring, 3d glasses 
  black, top hat, earring, 3d glasses 
  default, top hat, earring, 3d glasses 
  human1, top hat, earring, 3d glasses
  human2, top hat, earring, 3d glasses
  human3, top hat, earring, 3d glasses
  orange, top hat, earring, 3d glasses
  pink, bob blonde, cap, earring, 3d glasses
  zombie, top hat, gold chain, 3d glasses
  orc, top hat, gold chain, 3d glasses
  alien, headband

  maxibiz, beanie 
  black, knitted cap
  default,  headband
  human1, ski googles, luxuriousbeard
  human2, classic shades, luxuriousbeard light
  human3, peak spike, beard, cool shades
  orange, beard light, eye patch
  pink, peak spike blonde, earring, big shades
  zombie, chinstrap light
  orc, eyemask, gold chain, goat
  alien, cap forward, pipe

  maxibiz, cap2, bubblegum 
  black, cap3
  default, wizardhat
  human1, cowboyhat
  human2, wizardhat, bubblegum
  human3, crown
  orange, jesterhat, bubblegum
  pink, crown
  zombie, bandana2
  orc, frenchcap
  alien, bandana




  maxibiz, hoodie, vr
  black, hoodie, vr
  default, hoodie, vr
  human1, hoodie, vr
  human2, hoodie, vr
  human3, hoodie, vr
  orange, hoodie, vr
  pink, hoodie, vr, gold chain
  zombie, hoodie, vr
  orc, hoodie, vr
  alien, hoodie, vr

  maxibiz, clown eyes, clown nose, wild hair 
  black, clown eyes, clown nose, wild hair 
  default, clown eyes, clown nose, wild hair 
  human1, clown eyes,  clown nose, wild hair
  human2, clown eyes, clown nose, wild hair blonde
  human3, clown eyes, clown nose, wild hair
  orange, clown eyes, clown nose, wild hair red
  pink, clown eyes blue, clown nose, bob blonde
  zombie, clown eyes, clown nose, wild hair red
  orc,  clown eyes, clown nose,  wild hair purple
  alien, clown eyes, clown nose, wild hair purple

  maxibiz, mohawk2, lasereyes red
  black, mohawk2, lasereyes red
  default, mohawk2, lasereyes red
  human1, mohawk2, lasereyes green
  human2, mohawk2, lasereyes blue
  human3, mohawk2, lasereyes gold
  orange, mohawk2 red, lasereyes2 red
  pink, mohawk2 blonde, earring, lasereyes2 blue
  zombie, mohawk2 red, lasereyes2 green
  orc, mohawk2 purple, lasereyes2 red
  alien, mohawk2 purple, lasereyes2 gold

  maxibiz, wild hair, lasereyes3 red
  black, wild hair, lasereyes3 red
  default, wild hair, lasereyes3 red
  human1, wild hair, lasereyes3 green, clown nose
  human2, lasereyes3 blue, clown nose
  human3, lasereyes3 red
  orange, wild hair red, lasereyes3 green
  pink, bob blonde, lasereyes3 blue
  zombie, lasereyes3 green
  orc, lasereyes3 red
  alien, lasereyes3 gold

DATA




cols = 11
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0

composite = ImageComposite.new( cols, rows, 
                                  width: 24, height: 24 )

composite2 = ImageComposite.new( cols, rows, 
                                  width: 24, height: 24 )

specs.each_with_index do |spec, i|
     img = generate( *spec)
     img.save( "./tmp/monke#{i}.png" )
     img.zoom(10).save( "./tmp/monke#{i}@10x.png" )
     composite << img

     img2 = Image.new( 24, 24 )
     key = if base.index( 'default' )
             'backgrounddefault'
           else
            BACKGROUNDS[i % BACKGROUNDS.size ].gsub( /[^a-z0-9]/, '' ) 
           end
     img2.compose!( ATTRIBUTES[ key ] )
     img2.compose!( img )
     composite2 << img2
end


composite.save( "./tmp/welovemonkes.png" )
composite.zoom(4).save( "./tmp/welovemonkes@4x.png" )

composite2.save( "./tmp/welovemonkes2.png" )
composite2.zoom(4).save( "./tmp/welovemonkes2@4x.png" )

puts "bye"
