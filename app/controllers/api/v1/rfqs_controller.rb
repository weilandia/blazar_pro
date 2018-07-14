class Api::V1::RfqsController < Api::BaseController
  def create_from_email
    EmailProcessor.call(email_id: params[:email_id])

    head 202
  end
end
