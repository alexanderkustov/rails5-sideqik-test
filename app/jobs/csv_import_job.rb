class CsvImportJob < ApplicationJob
  queue_as :default
  after_perform :send_notification

  # in case job fails
  rescue_from(StandardError) do |exception|
    notify_failed_job_to_admin(exception)
  end

  def perform(filepath)
    CsvImporter.new(filepath).run
  end

  private

  def send_notification
    #NotificationMailer.job_done(User.find_manager).deliver_later
    puts "############## JOB COMPLETE ################"
  end

  def notify_failed_job_to_admin(exception)
    # NotificationMailer.job_failed(User.find_manager, exception).deliver_later
    puts "############## JOB FAILED ################"
  end
end
