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

    it "should have content 'Webonix' " do
      visit '/static_pages/home'
      expect(page).to have_content('Webonix')
    end

    it "should have the right 'Title' Головна " do
      visit '/static_pages/home'
      expect(page).to have_title("Webonix App | Головна")
    end
  end

  describe "Help page" do

    it "should have content 'Help' " do
      visit '/static_pages/help'
      expect(page).to have_content('FAQ')
    end

    it "should have the right title 'Help' " do
      visit '/static_pages/help'
      expect(page).to have_title("Webonix App | Допомога")
    end
  end

  describe "About page" do

    it "should have content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
     end

     it "should have the right title 'About' " do
       visit '/static_pages/about'
       expect(page).to have_title("Webonix App | Про нас")
     end
    end
end
