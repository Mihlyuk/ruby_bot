#!/usr/bin/env ruby
require "sequel"
DB = Sequel.connect ENV["DATABASE_URL"]
puts "Cleaning old sessions..."
DB["DELETE FROM sessions WHERE last_seen_at < ?", Time.now - 24*60*60]
puts "done."