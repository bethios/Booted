require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:user) {User.create!(name: 'blocipedia user', email: 'blocipedia@bloc.com', password: 'helloworld')}
  let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body", private: false, user: user) }

  describe "attributes" do
    it "has title and body attributes" do
      expect(post).to have_attributes(title: "New Wiki Title", body: "New Wiki Body", private: false, user: user)
    end
  end
end
