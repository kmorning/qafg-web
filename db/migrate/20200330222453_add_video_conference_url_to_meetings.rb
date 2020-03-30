class AddVideoConferenceUrlToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :video_conference_url, :string
  end
end
