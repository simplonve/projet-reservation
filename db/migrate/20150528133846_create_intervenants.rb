class CreateIntervenants < ActiveRecord::Migration
  def change
  	create_table :intervenants do |t|
  		t.string :nom
  		t.string :prenom
  		t.string :email
  		t.string :telephone
  		t.date   :date
  		t.text   :description
  	end
  end
end
