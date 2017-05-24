require 'spec_helper'

describe Project do
    let(:user) { FactoryGirl.create(:user) }
    before do
      # Этот код идеоматически некорректен.
      @project = Project.new(name: "First projects", user_id: user.id)
    end

    subject { @project }

    it { should respond_to(:description) }
    it { should respond_to(:dead_line) }
    it { should respond_to(:condition) }
    it { should respond_to(:user_id) }

end
