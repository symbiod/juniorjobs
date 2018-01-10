class FbWorker
  include Sidekiq::Worker

  def perform(job_id)
    set_domain(job_id)
    @graph = Koala::Facebook::API.new(@token)
    @graph.put_wall_post("#{@job.title} \n
    Ссылка: http://juniorjobs.ru/job/#{@job.id}",
                         {
                         }, @target_id)
 end

  def set_domain(job_id)
    @job = Job.find_by(id: job_id)
    @token = ENV["FB_TOKEN_#{@job.country}"]
    @target_id = ENV["FB_GROUP_ID_#{@job.country}"]
  end
end
