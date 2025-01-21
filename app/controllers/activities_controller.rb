require "csv"

class ActivitiesController < ApplicationController
  def index
    @activities = Rails.cache.fetch("activities", expires_in: 1.minute) do
      fetch_activities(15)
    end
  end

  def download
    @activities = Rails.cache.read("activities")

    respond_to do |format|
      format.json do
        send_data @activities.to_json,
                  filename: "activities.json",
                  type: "application/json; charset=utf-8",
                  disposition: "attachment"
      end

      format.csv do
        csv_data = CSV.generate(headers: true) do |csv|
          csv << [ "Activity", "Type", "Participants", "Price", "Link", "Accessibility" ]

          @activities.each do |activity|
            csv << [
              activity["activity"],
              activity["type"],
              activity["participants"],
              activity["price"],
              activity["link"],
              activity["accessibility"]
            ]
          end
        end

        send_data csv_data,
                  filename: "activities.csv",
                  type: "text/csv; charset=utf-8",
                  disposition: "attachment"
      end
    end
  end

  private

  def fetch_activities(count)
    activities = []
    count.times do
      response = HTTP.get("https://bored.api.lewagon.com/api/activity")
      if response.status.success?
        activities << JSON.parse(response.body)
      end
    end
    activities
  rescue StandardError => e
    Rails.logger.error "Error fetching activities: #{e.message}"
    []
  end
end
