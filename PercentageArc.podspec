Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.name         = "PercentageArc"
  s.version      = "1.0.1"
  s.summary      = "PercentageArc custom UIView."
  s.description  = <<-DESC
  Percentage Arc custom UIView
                   DESC
  s.homepage     = "https://github.com/hennykat/PercentageArc"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.license      = "MIT"

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.author             = { "Hennessy" => "hennykdev@gmail.com" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.platform     = :ios, "11.0"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source       = { :path => '.' }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.source_files  = "PercentageArc/**/*.{swift}"
  s.exclude_files = "PercentageArc/Exclude"

end
