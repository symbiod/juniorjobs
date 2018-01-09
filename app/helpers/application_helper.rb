module ApplicationHelper
  def render_shared(partial)
    render "layouts/shared/#{partial}"
  end

  def body_class(options = {})
    extra_body_classes_symbol = options[:extra_body_classes_symbol] || :extra_body_classes
    qualified_controller_name = controller.controller_path.gsub('/','-')
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
      [t('activerecord.attributes.job.expired_ats.week', date: expired_date_for(job, 1.week).strftime('%d/%m/%Y')), expired_date_for(job, 1.week)],
      [t('activerecord.attributes.job.expired_ats.weeks', date: expired_date_for(job, 2.week).strftime('%d/%m/%Y')), expired_date_for(job, 2.week)],
      [t('activerecord.attributes.job.expired_ats.month', date: expired_date_for(job, 1.month).strftime('%d/%m/%Y')), expired_date_for(job, 1.month)]
    ]
  end

  private

  def expired_date_for(job, interval)
    (job.persisted? ? job.created_at.to_date : Date.current) + interval
  end
end
