require 'rubygems'
require 'bundler'

Bundler.require

require './lib/url_helpers'
require './app/services/wordfrequency'

class WordService < Sinatra::Base
	configure :development do
		register Sinatra::Reloader
	end

	helpers UrlHelpers
	set :root, File.dirname(__FILE__)

	get "/" do
		erb :index
	end

	get "/words" do
		content_type :text
		return JSON.pretty_generate(request.env)
	end

	post "/" do
		@words   = params[:words]
		@exclude = params[:exclude]

		if @words && @exclude
			@result  = parse_input(@words, @exclude)
		end
		erb :index
	end

	not_found do
		"Whoops! You requested a route that wasn't available."
	end
end


def parse_input(input, excludes)
	result = Hash.new(0)

	words = input.split(" ")
	exclude_list = excludes.split(",").map{|wd| wd.downcase.strip}

	words.each do |word|
		result[word.downcase.gsub(/[^a-z\d]/,"")] +=1 unless exclude_list.include?(word.downcase.gsub(/[^a-z\d]/,""))
	end
	return result
end