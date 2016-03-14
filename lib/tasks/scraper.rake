namespace :scraper do
  desc "Run scraper"
  task :scrape => :environment do
    deck_names = []
    agent = Mechanize.new
    @browser = Watir::Browser.new
    @browser.goto("https://tempostorm.com/hearthstone/meta-snapshot")
    wait_for_js_home

    1.upto(4) do |deck_tier|
      click_tier_button(deck_tier)
      deck_names = get_deck_names

      @browser.buttons(:class => "deck-button").each_with_index do |deck_link, browser_index|
        quantity = []
        if deck_link.visible?
          deck_link.click

          @browser.windows[browser_index + 1].use do   # browser.windows[0] is main page
            wait_for_js_decks
            html = @browser.html
            # Create new mechanize page using watir browser html as input
            page = Mechanize::Page.new(nil, {'content-type' => 'text/html'},
                                       html, nil, agent)
            deck_name = deck_names[browser_index]
            create_external_decks(deck_name, deck_tier)
            deck_id = ExternalDeck.find_by(name: deck_name).id

            @browser.divs(:class => "db-deck-card-qty").each do |qty|
              quantity << qty.text
            end

            # Replace empty quantity with "1"
            quantity.map! { |num| num == "2" ? "2" : "1" }

            page.search(".db-deck-card-name.ng-binding").each_with_index do |card, i|
              puts "#{deck_name}" + " #{card.text}" + " " "qty: " + "#{quantity[i]}"
              push_deck_cards(deck_id, card.text, quantity[i])
            end
          end
        end
      end

      click_tier_button(deck_tier)

    end

    @browser.close
  end
end

# Wait until browser finishes loading javascript for home
def wait_for_js_home
  Watir::Wait.until { @browser.div(:id => "tier4").exists? }
end

# Wait until browser finishes loading javascript for deck pages
def wait_for_js_decks
  Watir::Wait.until { @browser.div(:class => "comment-add m-b-sm").exists? }
end

# Click tier (1-4) buttons to make deck buttons visible
def click_tier_button(deck_tier)
  tier = deck_tier - 1
  @browser.buttons(:class, "btn-tier-collapse")[tier].click
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
def create_external_decks(deck_name, deck_tier)
  e = ExternalDeck.find_or_create_by(name: deck_name, deck_class: class_name, tier: deck_tier)
end

# Add deck card names + quantity associated to each ExternalDeck
def push_deck_cards(deck_id, card_name, quantity)
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

# Get class name
def class_name
  div = @browser.divs(:class => "bg-override")[0]
  class_name = div.class_name.split[1].capitalize
end
