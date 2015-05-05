require 'test_helper'

class FeedCategoryTest < ActiveSupport::TestCase
  context 'A FeedCategory' do
    should have_many(:feeds)
    should have_many(:entries)
    should have_and_belong_to_many(:users)

    should_not allow_mass_assignment_of(:id)
    should_not allow_mass_assignment_of(:feed_id)
    should allow_mass_assignment_of(:name)
    should allow_mass_assignment_of(:priority)

    should validate_presence_of(:name)
    should validate_presence_of(:priority)
  end
end
