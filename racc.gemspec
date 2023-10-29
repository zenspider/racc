# -*- encoding: utf-8 -*-

begin
  require_relative "lib/racc/info"
rescue LoadError # Fallback to load version file in ruby core repository
  require_relative "info"
end

Gem::Specification.new do |s|
  s.name = "racc"
  s.version = Racc::VERSION
  s.summary = "Racc is a LALR(1) parser generator"
  s.description = <<DESC
Racc is a LALR(1) parser generator.
  It is written in Ruby itself, and generates Ruby program.

  NOTE: Ruby 1.8.x comes with Racc runtime module.  You
  can run your parsers generated by racc 1.4.x out of the
  box.
DESC
  s.authors = ["Minero Aoki", "Aaron Patterson"]
  s.email = [nil, "aaron@tenderlovemaking.com"]
  s.homepage = "https://github.com/ruby/racc"
  s.licenses = ["Ruby", "BSD-2-Clause"]
  s.executables = ["racc"]
  s.files = [
    "COPYING", "ChangeLog", "TODO",
    "README.ja.rdoc", "README.rdoc", "bin/racc",
    "ext/racc/MANIFEST",
    "ext/racc/cparse/cparse.c",
    "ext/racc/cparse/extconf.rb",
    "lib/racc.rb", "lib/racc/compat.rb",
    "lib/racc/debugflags.rb", "lib/racc/exception.rb",
    "lib/racc/grammar.rb", "lib/racc/grammarfileparser.rb",
    "lib/racc/info.rb", "lib/racc/iset.rb",
    "lib/racc/logfilegenerator.rb", "lib/racc/parser-text.rb",
    "lib/racc/parser.rb", "lib/racc/parserfilegenerator.rb",
    "lib/racc/sourcetext.rb",
    "lib/racc/state.rb", "lib/racc/statetransitiontable.rb",
    "lib/racc/static.rb",
    "doc/en/grammar.en.rdoc", "doc/en/grammar2.en.rdoc",
    "doc/ja/command.ja.html", "doc/ja/debug.ja.rdoc",
    "doc/ja/grammar.ja.rdoc", "doc/ja/index.ja.html",
    "doc/ja/parser.ja.rdoc", "doc/ja/usage.ja.html",
  ]
  s.require_paths = ["lib"]
  s.required_ruby_version = ">= 2.5"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.extra_rdoc_files = ["README.ja.rdoc", "README.rdoc"]

  if RUBY_PLATFORM =~ /java/
    s.files << 'lib/racc/cparse-jruby.jar'
    s.platform = 'java'
  else
    s.extensions = ["ext/racc/cparse/extconf.rb"]
  end
end
