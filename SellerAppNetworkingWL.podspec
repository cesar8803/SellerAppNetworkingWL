Pod::Spec.new do |s|

# 1 Settings

s.platform = :ios
s.ios.deployment_target = '10.0'
s.name = "SellerAppNetworkingWL"
s.summary = "Pod con la coleccion de servicios de Worklight."
s.requires_arc = true


# 2 Version

s.version = "1.0.4"


# 3 License

s.license = { :type => "MIT", :file => "LICENSE" }


# 4 Author

s.author = { "Luis Guillermo Cuevas Garcia" => "lucuevas@deloittemx.com" }


# 5 HomePage

s.homepage = "https://www.liverpool.com.mx"


# 6 URL Git

s.source = { :git => "https://github.com/cesar8803/SellerAppNetworkingWL.git", :tag => "#{s.version}" }


# 7 Dependencies

s.framework = "Foundation"
s.dependency 'Alamofire', '~> 4.0'
s.dependency 'AlamofireObjectMapper', '~> 4.0'


# 8 Sources Files

s.source_files = "SellerAppNetworkingWL/**/*.{swift}"

# 9 Resources

# s.resources = "SellerAppNetworkingWL/**/*.{png,jpeg,jpg,storyboard,xib}"

end
