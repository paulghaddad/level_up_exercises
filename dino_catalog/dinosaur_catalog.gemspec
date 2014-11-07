Gem::Specification.new do |s|
  s.name         = "dinosaur_catalog"
  s.version      = "2.0"
  s.author       = "Paul Haddad"
  s.email        = "paul.g.haddad@gmail.com"
  s.summary      = "Ruby program for the Dino Catalog Exercise as part of the Level Up Program."
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'dinosaur_catalog' ]

  s.required_ruby_version = '>=2.0'
end
