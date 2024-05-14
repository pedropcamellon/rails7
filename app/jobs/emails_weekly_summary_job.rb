class EmailsWeeklySummaryJob < ApplicationJob
  queue_as :emails

  def perform(*args)
    # Do something later
  end
end
