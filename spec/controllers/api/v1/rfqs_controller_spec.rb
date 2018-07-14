require 'rails_helper'

RSpec.describe Api::V1::RfqsController, type: :controller do
  describe 'POST#create_from_email' do
    it "returns 202" do
      post :create_from_email, params: { email_id: "j9302-ds" }
      expect(response.status).to eq(202)
    end

    it "processes email" do
      allow(EmailProcessor).to receive(:call)
      post :create_from_email, params: { email_id: "j9302-ds" }
      expect(EmailProcessor).to have_received(:call).with(email_id: "j9302-ds")
    end
  end
end
