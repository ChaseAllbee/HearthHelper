class User < ActiveRecord::Base
  attr_accessor :remember_token
  has_one :collection, dependent: :destroy
  has_many :saved_external_decks
  has_many :external_decks, through: :saved_external_decks
  has_many :user_decks, dependent: :destroy
  before_save   :downcase_email
  after_create :initialize_collection
  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9]+\z/
  validates :username, presence: true, length: { maximum: 20 },
                       format: { with: VALID_USERNAME_REGEX },
                       uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # Returns hash digest of string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers user in database for persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Removes user remember digest
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Tracks deck for current user
  def track(deck)
    saved_external_decks.create(external_deck_id: deck.id)
  end

  # Untracks deck for current user
  def untrack(deck)
    saved_external_decks.find(deck.id).destroy
  end

  # Returns true if the current user is following the deck
  def tracked?(deck)
    external_decks.include?(deck)
  end

  private

    # Converts email to all lower-case
    def downcase_email
      self.email = email.downcase
    end

    # Initializes user's collection with free cards
    def initialize_collection
      self.build_collection(dust: 0)
      cards = Card.where(rarity: "Free").where(card_set: "Basic")
      cards.each { |card| self.collection.cards << card }
      self.collection.save
    end
end
