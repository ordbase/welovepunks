require 'pixelart'


require_relative 'base'



specs = parse_data( <<DATA )
  ## try apes 
  ape, cap forward
  ape, cap, eye patch
  ape, knitted cap,  small shades
  ape, bandana, nerd glasses
  ape, headband (ii), small shades
  ape, bandana,  vr
  ape, cap
  ape, cap forward, earring

  ape, hoodie
  ape, bandana
  ape, do-rag
  ape, eye mask, do-rag, vape 
  ape, gold chain, knitted cap
  ape, horned rim glasses, do-rag
  ape, cowboy hat
  ape, police cap  
  ape, cap, earring, cigarette
  ape, cap, earring,  eye patch
  ape, fedora
  ape, nerd glasses, knitted cap
  ape, knitted cap
  ape, top hat, regular shades
  ape, bandana, big shades
  ape, 3d glasses, cowboy hat  

  ## todo: 2nd run with ape golden!!!
  ape golden, cap forward
  ape golden, cap, eye patch
  ape golden, knitted cap,  small shades
  ape golden, bandana, nerd glasses
  ape golden, headband (ii), small shades
  ape golden, bandana,  vr
  ape golden, cap
  ape golden, cap forward, earring

  ape golden, hoodie
  ape golden, bandana
  ape golden, do-rag
  ape golden, eye mask, do-rag, vape 
  ape golden, gold chain, knitted cap
  ape golden, horned rim glasses, do-rag
  ape golden, cowboy hat
  ape golden, police cap  
  ape golden, cap, earring, cigarette
  ape golden, cap, earring,  eye patch
  ape golden, fedora
  ape golden, nerd glasses, knitted cap
  ape golden, knitted cap
  ape golden, top hat, regular shades
  ape golden, bandana, big shades
  ape golden, 3d glasses, cowboy hat  
DATA


cols = 8
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0

composite = ImageComposite.new( cols, rows, 
                                  width: 24, height: 24 )


specs.each_with_index do |spec, i| 
     img = generate( *spec)
     
     img.save( "./tmp/ape#{i}.png" )
     img.zoom(10).save( "./tmp/ape#{i}@10x.png" )
     composite << img
end


composite.save( "./tmp/apes.png" )
composite.zoom(4).save( "./tmp/apes@4x.png" )

puts "bye"
