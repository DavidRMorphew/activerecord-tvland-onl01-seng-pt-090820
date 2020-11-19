class Show < ActiveRecord::Base
    has_many :characters
    has_many :actors, through: :characters
    belongs_to :network

    def build_network(args)
        new_network = Network.create(args)
        new_network.shows << self
    end

    def actors_list
        self.actors.map {|actor| actor.full_name}
    end
end