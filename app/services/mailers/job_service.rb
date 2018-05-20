# # frozen_string_literal: true

# module Web
#   module Mailers
#     # Service responsible for mailing job owner and admins
#     class JobService
#       def self.call(id)
#         EmailToAdminJob.perform_later(id)
#         EmailToAuthorJob.perform_later(id)
#       end
#     end
#   end
# end
