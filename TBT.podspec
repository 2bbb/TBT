Pod::Spec.new do |s|
  s.name         = "TBT"
  s.version      = "0.0.1"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.summary      = "Objective-C categories and utilities"
  s.homepage     = "https://github.com/2bbb/TBT"
  s.author       = { "Author" => "ishii@buffer-renaiss.com" }
  s.source       = { :git => "https://github.com/2bbb/TBT.git", :tag => "#{s.version}" }
  s.platform     = :ios, '6.0'
  s.requires_arc = true
  s.public_header_files = '{Categories,Utilities}/*.h'
  s.source_files  = '{Categories,Utilities}/*.{h,m}'
end