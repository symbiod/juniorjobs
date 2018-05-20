# frozen_string_literal: true

# Keeps flashes layout helpers
module FlashesHelper
  def flashes
    flash.to_hash.slice('alert', 'error', 'notice', 'success')
  end
end
