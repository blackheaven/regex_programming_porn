require "#{File.dirname(__FILE__)}/lib/interaction/cli"
require "#{File.dirname(__FILE__)}/lib/builder"
f = Builder.new.parse(File.new(File.dirname(__FILE__) + '/examples/ex1.yml'))
Interaction::Cli.new(f).run($stdin, $stdout)
