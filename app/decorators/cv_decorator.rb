# frozen_string_literal: true

require 'delegate'

class CvDecorator < SimpleDelegator
  def decorated_bar
    puts "This is a decorated #{bar}"
  end

  def city_remote
    if cv.city.present?
      "#{cv.city}#{cv.remote ? + '/' + I18n.t('activerecord.attributes.job.remote') : ''}"
    elsif cv.remote.present?
      I18n.t('activerecord.attributes.job.remote')
    end
  end

  def cv
    __getobj__
  end
end
