require 'mail'
require 'pdf-reader'

class EmailProcessor
  def self.call(email_id: "email_test.txt")
    self.new(email_id)
  end

  attr_reader :raw_email, :email, :rfq

  def initialize(email_id)
    @raw_email = get_raw_email(email_id)
    @email = Mail::Message.new(raw_email)
    @rfq = Rfq.new(rfq_num: rfq_num)
    process
  end

  def process
    write_raw_email
    write_attachments
    rfq.save
  end

  private

    def get_raw_email(email_id)
      $s3_client.object("email-received/#{email_id}").get.body.read
    end

    def rfq_num
      binding.pry
      @_rfq_num ||= "95219"
    end

    def write_attachments
      email.attachments.each do |attachment|
        rfq.attachments.attach(io: StringIO.new(attachment.decoded), filename: attachment.filename)
      end
    end

    def write_raw_email
      rfq.raw_email.attach(io: StringIO.new(raw_email), filename: "#{rfq_num}.txt")
    end
end
