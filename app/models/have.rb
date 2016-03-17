class Have < Ownership
    has_many :haves, class_name: "Have", foreign_key: "user_id", dependent: :destroy
    has_many :have_items , through: :haves, source: :item
end
