require 'mail'
require 'pdf-reader'

class EmailProcessor
  def self.call(email_id: "email_test.txt")
    self.new(email_id)
  end

  attr_reader :email

  def initialize(email_id)
    @email = Mail::Message.new(get_raw_email(email_id))
  end

  def process_attachments
  end

  private

    def get_raw_email(email_id)
      $s3_client.object("email-received/#{email_id}").get.body.read
    end

    def read_pdf_text(pdf)
      reader = PDF::Reader.new("somefile.pdf")

      reader.pages.inject("") do |text, page|
        text << page.text
      end
    end
end
