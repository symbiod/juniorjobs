class BaseWorker

 def set_domain( job_id, post_to)
    @job = Job.find_by(id: job_id)
    @token = ENV["#{post_to}_TOKEN_#{@job.country}"]
    @group_id = ENV["#{post_to}_GROUP_ID_#{@job.country}"]
    @link = "http://juniorjobs.#{@job.country}/job/#{@job.id}"
    @message = "Требуется:
      #{@job.title} (#{@job.city}, от #{@job.salary_from}) \n
      Компания2222222: #{@job.company_name}
      Откликнуться: #{@link}"
   end
end
