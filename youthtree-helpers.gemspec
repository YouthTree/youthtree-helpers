# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{youthtree-helpers}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Darcy Laycock"]
  s.date = %q{2010-08-23}
  s.description = %q{Helpers to make life easier when coding YT-specific apps. see the code..}
  s.email = %q{sutto@sutto.net}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.md",
     "Rakefile",
     "lib/youth_tree/helpers.rb",
     "lib/youth_tree/helpers/analytics_helper.rb",
     "lib/youth_tree/helpers/assets_helper.rb",
     "lib/youth_tree/helpers/embed_helper.rb",
     "lib/youth_tree/helpers/general_helper.rb",
     "lib/youth_tree/helpers/sidebar_helper.rb",
     "lib/youth_tree/helpers/uuid_tracker_helper.rb",
     "lib/youthtree-helpers.rb",
     "youthtree-helpers.gemspec"
  ]
  s.homepage = %q{http://github.com/YouthTree/youthtree-helpers}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A exceedingly simple set of helpers used across Youth Tree web applications.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, ["~> 3.0.0.rc"])
      s.add_runtime_dependency(%q<actionpack>, ["~> 3.0.0.rc"])
      s.add_runtime_dependency(%q<youthtree-js>, [">= 0"])
      s.add_runtime_dependency(%q<youthtree-settings>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, ["~> 3.0.0.rc"])
      s.add_dependency(%q<actionpack>, ["~> 3.0.0.rc"])
      s.add_dependency(%q<youthtree-js>, [">= 0"])
      s.add_dependency(%q<youthtree-settings>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, ["~> 3.0.0.rc"])
    s.add_dependency(%q<actionpack>, ["~> 3.0.0.rc"])
    s.add_dependency(%q<youthtree-js>, [">= 0"])
    s.add_dependency(%q<youthtree-settings>, [">= 0"])
  end
end

