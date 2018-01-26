# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SocialWebPosterService do
  it 'VkontakteWorker is working' do
    expect { SocialWebPosterService.new.post_job(1) }.to change(VkontakteWorker.jobs, :size).by(1)
  end
  it 'FacebookWorker is working' do
    expect { SocialWebPosterService.new.post_job(1) }.to change(FacebookWorker.jobs, :size).by(1)
  end
  it 'TelegramWorker is working' do
    expect { SocialWebPosterService.new.post_job(1) }.to change(TelegramWorker.jobs, :size).by(1)
  end
  it 'TwitterWorker is working' do
    expect { SocialWebPosterService.new.post_job(1) }.to change(TwitterWorker.jobs, :size).by(1)
  end
end
