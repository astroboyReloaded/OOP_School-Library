#!/usr/bin/env ruby

$stdout.sync = true

require_relative 'app'

def main
  app = App.new
  app.run
end

main
