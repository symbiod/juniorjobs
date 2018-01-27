# frozen_string_literal: true

# Decorate methods for Job model. Example: @jobs = Job.all.decorate
class JobDecorator < ApplicationDecorator
  delegate_all

  def expiration
    Date.today < object.expired_at ? t('decorators.job.active_status') : t('decorators.job.expired_status')
  end
end
