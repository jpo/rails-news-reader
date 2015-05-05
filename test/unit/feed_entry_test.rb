require 'test_helper'

class FeedEntryTest < ActiveSupport::TestCase
  context 'A FeedEntry' do
    should belong_to(:feed)

    should_not allow_mass_assignment_of(:id)
    should allow_mass_assignment_of(:title)
    should allow_mass_assignment_of(:summary)
    should allow_mass_assignment_of(:url)
    should allow_mass_assignment_of(:published)

    should validate_presence_of(:title)
    should validate_presence_of(:summary)
    should validate_presence_of(:url)
    should validate_presence_of(:published)
  end
end
