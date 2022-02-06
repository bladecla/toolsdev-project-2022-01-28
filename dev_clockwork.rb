require 'clockwork'
require 'clockwork/database_events'
require_relative './config/boot'
require_relative './config/environment'

module Clockwork

  handler do | job |
    job.perform
  end

  every(30.minutes, UpsertIntervalsJob.new)

end