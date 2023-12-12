require 'pixelart'

require_relative 'base'



specs = read_csv( "./welovemonkes.csv" )


cols = 100
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0

composite = ImageComposite.new( cols, rows, 
                                  width: 24, height: 24 )


specs.each_with_index do |rec, i|
     base = rec['type']
     accessories = (rec[ 'accessories'] || '' ).split( '/').map { |acc| acc.strip }

     spec = [base] + accessories

     frame = Image.new( 24, 24 )
     key = if base.index( 'default' )
             'backgrounddefault'
           else
             BACKGROUNDS[i % BACKGROUNDS.size ].gsub( /[^a-z0-9]/, '' ) 
           end
     frame.compose!( ATTRIBUTES[ key ] )

     frame.compose!( generate( *spec) )
     
     num = "%04d" % i
     puts "==> monke #{num}"
     frame.save( "./tmp/i/monke#{num}.png" )
     frame.zoom(8).save( "./tmp/i@8x/monke#{num}@8x.png" )
     
     composite << frame
end


composite.save( "./tmp/welovemonkes.png" )

puts "bye"
