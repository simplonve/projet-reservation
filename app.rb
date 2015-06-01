require 'sinatra'
require 'sinatra/activerecord'
require './environments'

ActiveRecord::Base.default_timezone = :local

class Intervenant < ActiveRecord::Base
end

get "/" do
  @m = {6=>["Juin", 30, 1], 7=>["Juillet", 31, 3], 8=>["Août", 31, 6], 9=>["Septembre", 30, 2], 10=>["Octobre", 31, 4]}
  @d = ["Lundi", "Mardi", "Mercredi" , "Jeudi", "Vendredi", "Samedi", "Dimanche"]
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

