require 'pixelart'


require_relative 'base'


specs = parse_data( <<DATA )
  joe
  joe, 3d glasses
  joe, vr
  joe, polarized shades
  joe, laser eyes blue
  joe, laser eyes 2 blue
  joe, laser eyes 3 blue
  joe, cap blue
  joe, clown eyes blue, clown nose
  joe, clown eyes blue, clown nose, jester hat
  joe, regular shades
  joe, horned rim glasses
  joe, headphone
  joe, do-rag blue

  bg usa, joe
  bg blue, joe
  bg dollar pattern, joe
  bg bitcoin orange, joe
  bg bitcoin pattern, joe
  bg rainbow, joe
  bg ukraine, joe

  donald
  donald, 3d glasses
  donald, vr
  donald, laser eyes red
  donald, laser eyes 2 red
  donald, laser eyes 3 red
  donald, cap red
  donald, clown eyes, clown nose
  donald, jester hat
  donald, crown
  donald, regular shades
  donald, horned rim glasses
  donald, headphone2
  donald, do-rag red

  bg usa, donald
  bg red, donald
  bg dollar pattern, donald
  bg bitcoin orange, donald
  bg bitcoin pattern, donald
  bg rainbow, donald
  bg ukraine, donald
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
