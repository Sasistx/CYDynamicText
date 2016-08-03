Pod::Spec.new do |s|

  s.name         = "CYDynamicText"
  s.version      = "1.0.0"
  s.summary      = "A custom dynamic font manager."
  s.description  = "A custom dynamic font manager."

  s.homepage     = "https://github.com/Sasistx/CYDynamicText"
  s.license      = "MIT"

  s.author             = { "gaotianxiang" => "gaotianxiang@chunyu.me" }
  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/Sasistx/CYDynamicText.git", :tag => s.version }

  s.source_files  = "CYDynamicText/Classes/**/*.{h,m}"
  s.resources    = "CYDynamicText/Resources/.*png"
end
