class HerokuClockworkTestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    message = "Clockwork is running on Heroku"
    rand(0..16).times { message << "!" }
    puts message

    UpdateController.render :partial => "update"
  end
end
