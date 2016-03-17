class Want < Ownership
    has_many :wants, class_name: "Want", foreign_key: "user_id", dependent: :destroy
    has_many :want_items , through: :wants, source: :item
end
