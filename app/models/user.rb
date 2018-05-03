class User < ApplicationRecord

	has_many :created_events, class_name: "Event", 	#relations d'inter-dépendance entre les tables.
							  foreign_key: "creator_id"
	has_and_belongs_to_many :attended_events, class_name: "Event"

	validates :name, presence: true, length: { maximum: 50 } #validation des entrées de l'utilisateur.

	has_secure_password #partie gestion du MDP.

    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
end
