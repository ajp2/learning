module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
  end

  def receive_toy(name)
    @toy = Toy.find_or_create_by(name: name) do |toy|
      toy.toyable_type = self.class.name
      toy.toyable_id = self.id
    end
  end
end