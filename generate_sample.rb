require 'pixelart'


require_relative 'base'



specs = parse_data( <<DATA )
 ## try new samples
 light, wild hair, cool shades, beard light
 light, headband, beard, 3d glasses, pipe
 light, knitted cap, big shades, beard

 orc, wild hair, medical mask, classic shades
 orc, wild hair, medical mask
 orc,  medical mask
 dark, do-rag, beard, 3d glasses
 dark, do-rag, beard
 dark, do-rag
 dark, long hair pink, cap small, clown eyes blue, mole, purple lipstick
 dark, long hair pink, mole, purple lipstick
 dark, long hair blonde, mole, purple lipstick
 light, long hair blonde, mole, purple lipstick

 ## archetypes
  maxibiz 
  black
  default
  dark
  light
  albino
  orange
  pink
  zombie
  orc
  alien

  maxibiz, mohawk
  black, mohawk
  default, mohawk
  dark, mohawk
  light, mohawk
  albino, mohawk
  orange, mohawk red
  pink, mohawk blonde, earring
  zombie, mohawk red
  orc, mohawk purple
  alien, mohawk purple

  maxibiz, top hat, earring, 3d glasses 
  black, top hat, earring, 3d glasses 
  default, top hat, earring, 3d glasses 
  dark, top hat, earring, 3d glasses
  light, top hat, earring, 3d glasses
  albino, top hat, earring, 3d glasses
  orange, top hat, earring, 3d glasses
  pink, bob blonde, cap small, earring, 3d glasses
  zombie, top hat, gold chain, 3d glasses
  orc, top hat, gold chain, 3d glasses
  alien, headband

  maxibiz, beanie 
  black, knitted cap
  default,  headband
  dark, polarized shades, luxuriousbeard
  light, classic shades, luxuriousbeard light
  albino, peak spike, beard, cool shades
  orange, beard light, eye patch
  pink, peak spike blonde, earring, big shades
  zombie, chinstrap light
  orc, eyemask, gold chain, goat
  alien, cap forward, pipe

  maxibiz, cap mcb, bubblegum 
  black, cap
  default, wizardhat
  dark, cowboyhat
  light, wizardhat, bubblegum
  albino, crown
  orange, jesterhat, bubblegum
  pink, crown
  zombie, bandana2
  orc, frenchcap
  alien, bandana




  maxibiz, hoodie, vr
  black, hoodie, vr
  default, hoodie, vr
  dark, hoodie, vr
  light, hoodie, vr
  albino, hoodie, vr
  orange, hoodie, vr
  pink, hoodie, vr, gold chain
  zombie, hoodie, vr
  orc, hoodie, vr
  alien, hoodie, vr

  maxibiz, clown eyes, clown nose, wild hair 
  black, clown eyes, clown nose, wild hair 
  default, clown eyes, clown nose, wild hair 
  dark, clown eyes,  clown nose, wild hair
  light, clown eyes, clown nose, wild hair blonde
  albino, clown eyes, clown nose, wild hair
  orange, clown eyes, clown nose, wild hair red
  pink, clown eyes blue, clown nose, bob blonde
  zombie, clown eyes, clown nose, wild hair red
  orc,  clown eyes, clown nose,  wild hair purple
  alien, clown eyes, clown nose, wild hair purple

  maxibiz, mohawk2, lasereyes red
  black, mohawk2, lasereyes red
  default, mohawk2, lasereyes red
  dark, mohawk2, lasereyes green
  light, mohawk2, lasereyes blue
  albino, mohawk2, lasereyes gold
  orange, mohawk2 red, lasereyes2 red
  pink, mohawk2 blonde, earring, lasereyes2 blue
  zombie, mohawk2 red, lasereyes2 green
  orc, mohawk2 purple, lasereyes2 red
  alien, mohawk2 purple, lasereyes2 gold

  maxibiz, wild hair, lasereyes3 red
  black, wild hair, lasereyes3 red
  default, wild hair, lasereyes3 red
  dark, wild hair, lasereyes3 green, clown nose
  light, lasereyes3 blue, clown nose
  albino, lasereyes3 red
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


specs.each_with_index do |spec, i| 
     img = generate( *spec)
     
     img.save( "./tmp/punk#{i}.png" )
     img.zoom(10).save( "./tmp/punk#{i}@10x.png" )
     composite << img
end


composite.save( "./tmp/welovepunks.png" )
composite.zoom(4).save( "./tmp/welovepunks@4x.png" )

puts "bye"
