require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Зареєструватись у системі') }
    it { should have_title(full_title('Реєстрація')) }
  end
end
