#require 'rails_helper'

#RSpec.describe "StaticPages", type: :request do
#  describe "GET /static_pages" do
#    it "works! (now write some real specs)" do
#      get static_pages_index_path
#      expect(response).to have_http_status(200)
#    end
#  end
#end
require 'spec_helper'

describe "Static pages" do
  describe "Home page" do

    it "should have the content 'Webonix' " do
      visit '/static_pages/home'
      expect(page).to have_content('Webonix')
    end
  end

  describe "Help page" do

    it "should have content 'Help' " do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
  end

  describe "About page" do

    it "should have content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
     end
    end
end
