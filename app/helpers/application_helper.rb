# frozen_string_literal: true

# TODO: documentation is missing for this class
# We should consider addig some documentation here
module ApplicationHelper
  def render_shared(partial)
    render "layouts/shared/#{partial}"
  end

  def body_class(options = {})
    extra_body_classes_symbol = options[:extra_body_classes_symbol] || :extra_body_classes
    qualified_controller_name = controller.controller_path.tr('/', '-')
    basic_body_class = "#{qualified_controller_name} #{qualified_controller_name}-#{controller.action_name}"

    if content_for?(extra_body_classes_symbol)
      [basic_body_class, content_for(extra_body_classes_symbol)].join(' ')
    else
      basic_body_class
    end
  end

  def flashes
    flash.to_hash.slice('alert', 'error', 'notice', 'success')
  end

  def current_country
    :ru
  end

  def expired_at_dates_for(job)
    [
      expires_at(job, '1_week'),
      expires_at(job, '2_week'),
      expires_at(job, '1_month')
    ]
  end

  # Returns option for select, according to passed modifier
  # e.g. modifier can be '1_week'
  # The method dynamically parses modifier and generated output for 1.week method
  # @return Array<String>
  def expires_at(job, modifier)
    num, period = modifier.split('_')
    num = num.to_i
    text = t("activerecord.attributes.job.expired_ats.#{modifier}", date: expired_date_for(job, num.send(period)))
           .strftime('%d/%m/%Y')
    value = expired_date_for(job, num.send(:period))
    [text, value]
  end

  private

  def expired_date_for(job, interval)
    (job.persisted? ? job.created_at.to_date : Date.current) + interval
  end
end
