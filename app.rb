require 'sinatra'
require 'sinatra/activerecord'
require './environments'

ActiveRecord::Base.default_timezone = :local

class Intervenant < ActiveRecord::Base
end

get "/" do
  @intervenant = Intervenant.all
  @title = "Intervenants"
  erb :index
end

get "/reservation" do
  @title = "Formulaire"
  erb :reservation
end

post "/reservation" do
	@intervenant = Intervenant.new(params[:resa])
	@intervenant.save
	redirect "/"
end

