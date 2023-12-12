require 'pixelart'

require_relative 'base'



specs = read_csv( "./welovemonkes.csv" )


cols = 100
rows = specs.size / cols 
rows += 1    if specs.size % cols != 0

composite = ImageComposite.new( cols, rows, 
                                  width: 24, height: 24 )


specs.each_with_index do |rec, i|
     base        = rec['type']
     accessories = (rec[ 'accessories'] || '' ).split( '/').map { |acc| acc.strip }
     background  = rec['background']
     
     spec = ["bg #{background}", base] + accessories

     img = generate( *spec )
     
     num = "%04d" % i
     puts "==> monke #{num}"
     img.save( "./tmp/i/monke#{num}.png" )
     img.zoom(8).save( "./tmp/i@8x/monke#{num}@8x.png" )
     
     composite << img
end


composite.save( "./tmp/welovemonkes.png" )

puts "bye"
