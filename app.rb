require 'sinatra'
require 'sinatra/activerecord'
require './environments'

ActiveRecord::Base.default_timezone = :local

get "/" do
  @title = "Intervenants"
  erb :index
end

get "/reservation" do
  @title = "Formulaire"
  erb :reservation
end