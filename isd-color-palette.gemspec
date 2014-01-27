# -*- encoding: utf-8 -*-
VERSION = "0.1.1"

Gem::Specification.new do |spec|
  spec.name          = "isd-color-palette"
  spec.version       = VERSION
  spec.authors       = ["Katsuyoshi Ito"]
  spec.email         = ["kito@itosoft.com"]
  spec.description   = %q{ISDColorPalette is a color selection panel for the RubyMotion iOS app.}
  spec.summary       = %q{ISDColorPalette is a color selection panel for the RubyMotion iOS app.}
  spec.homepage      = "https://github.com/ito-soft-design/isd-color-palette"
  spec.license       = "MIT"

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  files.concat(Dir.glob('lib/resources/**/*.*'))
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
end
