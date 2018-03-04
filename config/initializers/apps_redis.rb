require 'singleton'

class AppsRedis
  include Singleton

  def connection
    @connection ||= Redis::Namespace.new("juniorjobs", redis: Redis.new)
  end
end

