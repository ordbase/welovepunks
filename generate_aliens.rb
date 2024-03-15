require 'pixelart'


require_relative 'base'



specs = parse_data( <<DATA )
 alien, bandana, regular shades 
 alien, cap
 alien, headband (ii)
 alien, cowboy hat, earring
 alien, bandana
 alien, do-rag, small shades   
 alien, knitted cap, earring
 alien, knitted cap, medical mask, earring
 alien, cap forward, small shades, pipe
DATA



cols = 3
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0

composite = ImageComposite.new( cols, rows, 
                                  width: 24, height: 24 )


specs.each_with_index do |spec, i| 
     img = generate( *spec)
     
     img.save( "./tmp/alien#{i}.png" )
     img.zoom(10).save( "./tmp/alien#{i}@10x.png" )
     composite << img
end


composite.save( "./tmp/aliens.png" )
composite.zoom(4).save( "./tmp/aliens@4x.png" )

puts "bye"
