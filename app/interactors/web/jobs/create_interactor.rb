# # frozen_string_literal: true

# module Web
#   module Jobs
#     # Web::Jobs::CreateInteractor responsible for creation job
#     # handles case with or wihtout current_user
#     class CreateInteractor < BaseInteractor
#       def call
#         model = build_model(params)
#         model.token = TokenGenerator.generate

#         context.model = model
#       end

#       private

#       def user
#         context.user
#       end

#       def params
#         context.params
#       end

#       def build_model(params)
#         user ? user.jobs.build(params) : Job.new(params)
#       end
#     end
#   end
# end
