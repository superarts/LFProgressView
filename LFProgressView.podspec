Pod::Spec.new do |s|
	s.name = 'LFProgressView'
	s.version = '1.3.0'
	s.summary = 'A configurable progress view with a single color setter written in CoreGraphics from LDProgressView'
	s.description = 'A flat or gradient progress view with a simple color setter and customizable options written in pure Core Graphics. Added some attributes to LDProgressView.'
	s.homepage = 'https://github.com/superarts/LDProgressView'
	s.license = {:type => 'MIT', :file => 'LICENSE'}
	s.author = {'Light Design' => 'lightdesigncoding@icloud.com', 'Christian Di Lorenzo' => 'rcddeveloper@icloud.com', 'Leo' => 'leo@superarts.org'}
	s.source = {:git => 'https://github.com/superarts/LDProgressView.git', :tag => s.version.to_s}
	s.platform = :ios, '6.0'
	s.source_files = 'LDProgressView/LFProgressView.*', 'LDProgressView/LDProgressView.*', 'LDProgressView/UIColor+RGBValues.*'
	s.framework = 'CoreGraphics'
	s.requires_arc = true
end
