# # frozen_string_literal: true

# module Web
#   module Jobs
#     # Update interactor update and disapprove job
#     class UpdateInteractor < BaseInteractor
#       def call
#         if model.update(params)
#           model.not_approve!
#           context.model = model
#         else
#           context.fail!(error: model.errors.messages[:email].first)
#         end
#       end

#       private

#       def params
#         context.params
#       end

#       def model
#         context.job
#       end
#     end
#   end
# end
