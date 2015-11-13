namespace :scraper do
  desc "Run scraper"
  task :scrape => :environment do
    quantity = []
    deck_names = []
    agent = Mechanize.new
    @browser = Watir::Browser.new
    @browser.goto("https://tempostorm.com/hearthstone/meta-snapshot")
    wait_for_js
    click_tier_buttons
    deck_names = get_deck_names

    @browser.buttons(:class => "deck-button").each_with_index do |deck_link, browser_index|
      deck_link.click

      @browser.windows[browser_index + 1].use do   # browser.windows[0] is main page
        html = @browser.html
        # Create new mechanize page using watir browser html as input
        page = Mechanize::Page.new(nil, {'content-type' => 'text/html'},
                                   html, nil, agent)
        push_deck_names(deck_names[browser_index])

        @browser.divs(:class => "db-deck-card-qty").each do |qty|
          quantity << qty.text
        end

        # Replace empty quantity with "1"
        quantity.map! { |num| num == "2" ? "2" : "1" }

        page.search(".db-deck-card-name.ng-binding").each_with_index do |card, i|
          deck_name = deck_names[browser_index]
          push_deck_cards(deck_name, card.text, quantity[i])
        end
      end
    end

    @browser.close
  end
end

# Wait until browser finishes loading javascript
def wait_for_js
  Watir::Wait.until { @browser.div(:id => "tier4").exists? }
end

# Click tier (1-4) buttons to make deck buttons visible
def click_tier_buttons
  @browser.buttons(:class, "btn-tier-collapse").each { |tier| tier.click }
end

# Return deck names with current month appended
def get_deck_names
  deck_names = []
  @browser.divs(:class => "tier-deck").each do |name|
    deck_names << name.text.sub!("\nVIEW DECK",
                                 " - #{Date.today.strftime("%B")}")
  end
  return deck_names
end

# Create ExternalDeck
def push_deck_names(deck_name)
  ExternalDeck.find_or_create_by(name: deck_name)
end

# Add deck card names + quantity associated to each ExternalDeck
def push_deck_cards(deck_name, card_name, quantity)
  deck_id = ExternalDeck.find_by(name: deck_name).id
  puts card_name
  if card_name == "Ancestors Call"
    card_id = Card.find_by(name: "Ancestor's Call").id
  elsif card_name == "Bouncing Blades"
    card_id = Card.find_by(name: "Bouncing Blade").id
  else
    card_id = Card.find_by(name: card_name).id
  end
  ExternalDeckInstance.find_or_create_by(external_deck_id: deck_id,
                                         card_id: card_id,
                                         quantity: quantity)
end
