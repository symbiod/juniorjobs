# frozen_string_literal: true

require_relative '../../../config/initializers/apps_redis'

module Cache
  # Responsible for loading and unloading the contributors into the Redis.
  class GithubService
    attr_reader :storage

    def initialize(storage = AppsRedis.instance.connection)
      @storage = storage
    end

    def fetch(key, default)
      collection = fetch_cache(key)
      collection.any? ? collection : write_cache(key, default) and default
    end

    def update(key, data)
      delete_cache(key)
      write_cache(key, data)
    end

    private

    def delete_cache(key)
      storage.del(key)
    end

    def fetch_cache(key)
      storage.lrange(key, 0, -1)
    end

    def write_cache(key, data)
      storage.rpush(key, data)
      storage.expire(key, 604_800)
    end
  end
end
