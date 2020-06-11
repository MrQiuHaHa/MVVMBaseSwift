

Pod::Spec.new do |s|
  s.name             = 'MVVMBaseSwift'
  s.version          = '0.1.2'
  s.summary          = 'A short description of MVVMBaseSwift.'


  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/MrQiuHaHa/MVVMBaseSwift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'qiujr' => '2574282239@qq.com' }
  s.source           = { :git => 'https://github.com/MrQiuHaHa/MVVMBaseSwift.git', :tag => s.version.to_s }
 

  s.ios.deployment_target = '10.0'

  s.source_files = 'MVVMBaseSwift/Classes/**/*'
  s.resource_bundles = {
    'YMLocalResources' => ['MVVMBaseSwift/Assets/*']
  }
   

  s.static_framework = true
  s.swift_version = '4.2'
  
  
  s.dependency 'SnapKit'
  s.dependency 'MJRefresh'
  s.dependency 'FDFullscreenPopGesture'
  
  s.pod_target_xcconfig = {
         'OTHER_LDFLAGS' => '$(inherited) -undefined dynamic_lookup',
         'ENABLE_BITCODE' => 'NO',
  }

end
