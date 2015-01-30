# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ans/minitest_helper/version'

Gem::Specification.new do |spec|
  spec.name          = "ans-minitest_helper"
  spec.version       = Ans::MinitestHelper::VERSION
  spec.authors       = ["sakai shunsuke"]
  spec.email         = ["sakai@ans-web.co.jp"]
  spec.summary       = %q{minitest 用の helper 集}
  spec.description   = %q{minitest でテスト用に使用する helper 集}
  spec.homepage      = "https://github.com/answer/ans-minitest_helper"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
