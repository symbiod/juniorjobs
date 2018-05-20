# frozen_string_literal: true

require 'singleton'

class AppsRedis
  include Singleton

  def connection
    @connection ||= Redis::Namespace.new("juniorjobs", redis: Redis.new(host: ENV['REDIS_HOST']))
  end
end
