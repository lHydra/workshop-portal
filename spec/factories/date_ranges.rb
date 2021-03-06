# == Schema Information
#
# Table name: date_ranges
#
#  id         :integer          not null, primary key
#  end_date   :date
#  start_date :date
#  created_at :datetime
#  updated_at :datetime
#  event_id   :integer
#
# Indexes
#
#  index_date_ranges_on_event_id  (event_id)
#

FactoryGirl.define do
    factory :date_range  do
        start_date Date.tomorrow.next_day(1)
        end_date Date.tomorrow.next_day(10)

        trait :with_negative_range do
            start_date Date.current.next_day(10)
            end_date Date.current.next_day(9)
        end

        trait :with_future_dates do
            start_date Date.current.next_day(3)
            end_date Date.current.next_day(6)
        end

        trait :which_is_surrounding_today do
            start_date Date.current.prev_day(3)
            end_date Date.current.next_day(2)
        end

        trait :on_single_day do
            start_date Date.tomorrow
            end_date Date.tomorrow
        end

        trait :in_the_past do
            start_date Date.current.prev_day(3)
            end_date Date.yesterday
        end
    end 
end
