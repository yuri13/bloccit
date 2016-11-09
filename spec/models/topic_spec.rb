require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:topic) { create(:topic) }

  it { is_expected.to have_many(:posts) }

# #confirm that topic responds to appropriate attributes
  describe "attributes" do
    it "responds to name and description attributes" do
      expect(topic).to have_attributes(name: topic.name, description: topic.description)
    end

# #confirm that public attribute is set to true
    it "is public by default" do
      expect(topic.public).to be(true)
    end
  end

end
