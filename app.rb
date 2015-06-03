require 'pry'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'
require './environments'

enable :sessions

ActiveRecord::Base.default_timezone = :local

class Intervenant < ActiveRecord::Base
  validates :nom, presence: true
  validates :prenom, presence: true
  validates :email, presence: true
  validates :telephone, presence: true
  validates :date, presence: true
end

get "/" do
  @month = {"06"=>["Juin", "June", 30, 1], "07"=>["Juillet", "July", 31, 3], "08"=>["Août", "August", 31, 6], "09"=>["Septembre", "September", 30, 2], "10"=>["Octobre", "October", 31, 4]}
  @day = ["Lundi", "Mardi", "Mercredi" , "Jeudi", "Vendredi", "Samedi", "Dimanche"]
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
  if @intervenant.save
    redirect "/"
  else
    redirect back, :error => "Veuillez remplir tous les champs du formulaire."
  end
end

