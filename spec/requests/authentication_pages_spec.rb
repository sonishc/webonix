require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin" do
    before {visit signin_path }

    describe "with invalid information" do
      before {click_button "Увійти"}

    it { should have_content('Вхід у систему') }
    it { should have_title('Вхід у систему') }

    describe "after visiting another page" do
      before {click_link 'Головна'}
      it {should_not have_selector('div.alert.alert-error')}
    end
  end

  describe "whith valid information" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      fill_in "Email", with: user.email.upcase
      fill_in "Пароль", with: user.password
      click_button "Увійти"
    end
    it { should have_title (user.name) }
    #it { should have_link('Профіль', href: user_path(user)) }
    it { should have_link('Вийти', href: signout_path) }
    it { should_not have_link('Увійти в систему', href: signin_path) }

    describe "followed by signout" do
      before {click_link "Вийти"}
      it { should have_link('Увійти в систему')}
    end
   end
  end
end
