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

  let(:base_title) { "Webonix app " }

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content ('Webonix') }
    it { should have_title (full_title('')) }
    it { should_not have_title (' | Головна ') }
    end

  describe "Help page" do
    before { visit help_path }

    it { should have_content('FAQ') }
    it {should have_title(full_title('Допомога')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About Us') }
    it { should have_title(full_title('Про нас')) }
  end

  describe "Contact page" do
    before { visit contact_path }

      it { should have_title(full_title('Контакти')) }
      it { should have_content('Контакти') }
  end
end
