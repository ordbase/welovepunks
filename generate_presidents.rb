require 'pixelart'


require_relative 'base'


specs = parse_data( <<DATA )
  ## try presidents
  joe
  joe, 3d glasses
  joe, vr
  joe, polarized shades
  joe, classic shades
  joe, laser eyes blue
  joe, laser eyes 2 blue
  joe, laser eyes 3 blue
  joe, cap blue
  joe, clown eyes blue, clown nose
  joe, clown eyes blue, clown nose, jester hat

  bg usa, joe
  bg blue, joe
  bg dollar pattern, joe
  bg bitcoin pattern, joe
  bg rainbow, joe

  donald
  donald, 3d glasses
  donald, vr
  donald, big shades
  donald, laser eyes red
  donald, laser eyes 2 red
  donald, laser eyes 3 red
  donald, cap mcb
  donald, clown eyes, clown nose
  donald, jester hat
  donald, crown

  bg usa, donald
  bg red, donald
  bg dollar pattern, donald
  bg bitcoin pattern, donald
  bg rainbow, donald
DATA



cols = 7  
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0

composite = ImageComposite.new( cols, rows, 
                                  width: 24, height: 24 )


specs.each_with_index do |spec, i| 
     img = generate( *spec)
     
     img.save( "./tmp/prez#{i}.png" )
     img.zoom(10).save( "./tmp/prez#{i}@10x.png" )
     composite << img
end


composite.save( "./tmp/presidents.png" )
composite.zoom(4).save( "./tmp/presidents@4x.png" )

puts "bye"
