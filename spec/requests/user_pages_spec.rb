require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    let(:submit) { "Створити мій акаунт" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Ім'я",             with: "Example User"
        fill_in "Email",             with: "user@example.com"
        fill_in "Пароль доступу",       with: "foobar"
        fill_in "Підтвердити пароль доступу", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end

  describe "profile page" do
    let(:user) {FactoryGirl.create(:user)}
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end
  #  it { should have_content('Зареєструватись у системі') }
  #  it { should have_title(full_title('Реєстрація')) }
  end
end
