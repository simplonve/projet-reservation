require 'sinatra'
require 'sinatra/activerecord'
require './environments'

ActiveRecord::Base.default_timezone = :local

class Intervenant < ActiveRecord::Base
end

get "/" do
  @m = {"06"=>["Juin", 30, 1], "07"=>["Juillet", 31, 3], "08"=>["Août", 31, 6], "09"=>["Septembre", 30, 2], "10"=>["Octobre", 31, 4]}
  @d = ["Lundi", "Mardi", "Mercredi" , "Jeudi", "Vendredi", "Samedi", "Dimanche"]
  @intervenant = Intervenant.all
  @title = "Intervenants"
  erb :index
end

get "/reservation" do
	@title = "Formulaire"
	erb :reservation
end

get "/reservation/:day-:month" do
  @title = "Formulaire"
  @date = "2015-#{params[:month]}-#{params[:day]}"
  erb :reservation
end

post "/reservation" do
	params[:description] = params[:description].gsub(/[<>]/, '')
	params[:resa]["description"] = params[:description]
	@intervenant = Intervenant.new(params[:resa])
	@intervenant.save
	redirect "/"
end

