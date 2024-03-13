require 'pixelart'


require_relative 'base'


specs = parse_data( <<DATA )
  ## try apes 
  ape
  ape, regular shades
  ape, knitted cap
  ape, bandana
  ape, cap mcd
  ape, hoodie
  
  ape golden
  ape golden, regular shades
  ape golden, laser eyes red
  ape golden, laser eyes 2 red
  ape golden, laser eyes 3 red
  ape golden, 3d glasses, crown
DATA



cols = 6
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
