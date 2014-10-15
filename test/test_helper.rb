require "bundler"

Bundler.require
Bundler.require :test

require "minitest/autorun"

Sequel.connect "sqlite://db/db.sqlite3"