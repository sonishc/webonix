require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Webonix app " }

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading)}
    it { should have_title(full_title(page_title))}
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)  { 'Webonix app' }
    let(:page_title)  { '' }

    it_should_behave_like "all static pages"
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

  it "should have the right links on the leyout" do
    visit root_path
    click_link "Головна"
    click_link "Зареєструватись у системі зараз!"
    expect(page).to have_title(full_title('Реєстрація'))
    click_link "Webonix app"
    click_link "Допомога"
    expect(page).to have_title(full_title('Допомога'))
    click_link "Про нас"
    expect(page).to have_title(full_title('Про нас'))
    click_link "Контакти"
    expect(page).to have_title(full_title('Контакти'))
  end
end
