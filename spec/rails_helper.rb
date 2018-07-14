config.before do
  WebMock.disable_net_connect!(allow_localhost: true)
  stub_request(:get, "https://#{ENV["S3_BUCKET"]}.s3-us-west-2.amazonaws.com/#{ENV["EMAIL_OBJECT_KEY_PREFIX"]}/test_sewp")
    .to_return(status: 200, body: File.read('spec/support/mock_emails/sewp'))
end
