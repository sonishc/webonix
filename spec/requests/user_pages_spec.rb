require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "pagination" do

        before(:all) { 10.times { FactoryGirl.create(:user) } }
        after(:all)  { User.delete_all }
      end

      describe "delete links" do

      it { should_not have_link('Видалити') }

      describe "as an admin user" do
        let(:admin) { FactoryGirl.create(:admin) }
        before do
          sign_in admin
          visit users_path
        end

      end
    end

  describe "profile page" do
    let(:user) {FactoryGirl.create(:user)}
    before { visit user_path(user) }

#    it { should have_content(user.name) }
#    it { should have_title(user.name) }
  end

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


  #  it { should have_content('Зареєструватись у системі') }
  #  it { should have_title(full_title('Реєстрація')) }
  end

  describe "edit" do
   let(:user) { FactoryGirl.create(:user) }
   before do
     sign_in user
     visit edit_user_path(user)
   end

   describe "page" do
     it { should have_content("Редагувати особисті дані профілю") }
     it { should have_title("Редагування користувача") }
     it { should have_link('Змінити фото', href: 'http://gravatar.com/emails') }
   end

   describe "with invalid information" do
     before { click_button "Зберегти зміни" }

     it { should have_content('error') }
   end

   describe "with valid information" do
     let(:new_name)  { "New Name" }
     let(:new_email) { "new@example.com" }
     before do
       fill_in "Ім'я",                            with: new_name
       fill_in "Email",                         with: new_email
       fill_in "Пароль",                      with: user.password
       fill_in "Підтвердити пароль", with: user.password
       click_button "Зберегти зміни"
     end

     it { should have_title(new_name) }
    it { should have_selector('div.alert.alert-success') }
    it { should have_link('Вийти', href: signout_path) }
    specify { expect(user.reload.name).to  eq new_name }
    specify { expect(user.reload.email).to eq new_email }
  end
 end
end
