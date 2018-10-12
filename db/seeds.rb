# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

# User to show the login vs anonymous feature.
User.create(email:'tester@example.com', password: 'tester', password_confirmation:'tester')

# Default Categories.  Ten items per category, using to_words plugin
Category.create(name:'antiques')
Category.create(name:'appliances')
Category.create(name:'arts+crafts')
Category.create(name:'atv/utv/sno')
Category.create(name:'auto parts')
Category.create(name:'aviation')
Category.create(name:'baby+kid')
Category.create(name:'barter')
Category.create(name:'beauty+hlth')
Category.create(name:'bike parts')
Category.create(name:'bikes')
Category.create(name:'boat parts')
Category.create(name:'boats')
Category.create(name:'books')
Category.create(name:'business')
Category.create(name:'cars+trucks')
Category.create(name:'cds/dvd/vhs')
Category.create(name:'cell phones')
Category.create(name:'clothes+acc')
Category.create(name:'collectibles')
Category.create(name:'computer parts')
Category.create(name:'computers')
Category.create(name:'electronics')
Category.create(name:'farm+garden')
Category.create(name:'free')
Category.create(name:'furniture')
Category.create(name:'garage sale')
Category.create(name:'general')
Category.create(name:'heavy equip')
Category.create(name:'household')
Category.create(name:'jewelry')
Category.create(name:'materials')
Category.create(name:'motorcycle parts')
Category.create(name:'motorcycles')
Category.create(name:'music instr')
Category.create(name:'photo+video')
Category.create(name:'rvs+camp')
Category.create(name:'sporting')
Category.create(name:'tickets')
Category.create(name:'tools')
Category.create(name:'toys+games')
Category.create(name:'trailers')
Category.create(name:'video gaming')
Category.create(name:'wanted')
Category.create(name:'wheels+tires')

Category.all.each{ |cat|
  (1..10).each { |ind|
    Post.create(title:"Number #{ind.to_words} thing to sell in #{cat.name}", description:"This is the default description for all the things in #{cat.name}", category_id:cat.id)
  }
}
