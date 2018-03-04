# frozen_string_literal: true

require_relative '../../config/initializers/apps_redis'

# The service is responsible for loading and unloading the contributors into the Redis.
class ContributorsService
  class << self
    def contributors
      redis.lrange(list, 0, -1)
    end

    def logins_add_to_list
      redis.rpush(list, load_logins)
      add_expire
      contributors
    end

    private

    def load_logins
      ContributorsBuilder.new.contributors_logins
    end

    def add_expire
      redis.expire(list, 604_800)
    end

    def redis
      AppsRedis.instance.connection
    end

    def list
      'contributors'
    end
  end
end
