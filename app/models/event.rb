class Event < ApplicationRecord

	belongs_to :creator, class_name: "User"#relations d'inter-dépendance entre les tables.
	has_and_belongs_to_many :attendees, class_name: "User"

	validates :description, presence: true #validation des entrées de l'événement.
	validates :date, presence: true
  validates :place, presence: true
end
