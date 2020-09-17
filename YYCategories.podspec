Pod::Spec.new do |s|
  s.name         = 'YYCategories'
  s.summary      = 'A manager to get iOS keyboard views, frames and transform.'
  s.version      = '1.0.4'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'ibireme' => 'ibireme@gmail.com' }
  s.social_media_url = 'http://blog.ibireme.com'
  s.homepage     = 'https://github.com/xfdev/YYCategories'
  s.platform     = :ios, '6.0'
  s.ios.deployment_target = '6.0'
  s.source       = { :git => 'https://github.com/xfdev/YYCategories.git', :tag => s.version.to_s }
  
  s.requires_arc = true
  s.source_files = 'YYCategories/**/*.{h,m}'
  s.public_header_files = 'YYCategories/**/*.{h}'
  
  s.libraries = 'z'
  s.frameworks = 'UIKit', 'CoreFoundation' ,'QuartzCore', 'CoreGraphics', 'CoreImage', 'CoreText', 'ImageIO', 'Accelerate'

end
