# frozen_string_literal: true

require_relative '../../config/initializers/apps_redis'

class ContributorsService
  # class << self
  #   def contributors
  #     contributors = redis.lrange(key_name, 0, -1)
  #     contributors.empty? ? reload_list : contributors
  #   end
  #
  #   def reload_list
  #     destroy_list
  #     add_to_list
  #     add_expire
  #     contributors
  #   end
  #
  #   private
  #
  #   def destroy_list
  #     redis.del(key_name)
  #   end
  #
  #   def add_to_list
  #     redis.rpush(key_name, load_logins)
  #   end
  #
  #   def load_logins
  #     ContributorsBuilder.new.contributors_logins
  #   end
  #
  #   def add_expire
  #     redis.expire(key_name, 604_800)
  #   end
  #
  #   def redis
  #     AppsRedis.instance.connection
  #   end
  #
  #   def key_name
  #     'contributors'
  #   end
  # end
end
