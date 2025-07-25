require "uri"
require "net/http"
require "json"
require "mail"

require_relative "../config/settings"

module Notifier
  def self.send_email_alert(subject, body)
    Mail.deliver do
      from "contactdevhanspeter@gmail.com"
      to "hansdietiker2012@gmail.com"
      subject subject
      body body
      delivery_method :smtp, {
        address: "seu.smtp.server ",
        port: 587,
        user_name: "test",
        password: "123test",
        authentication: "plain",
        enable_starttls_auto: true,
      }
    end
    puts "[EMAIL ALERT] #{subject}"
  rescue StandartError => e
    puts "Error to send email : #{e.message}"
  end

  def self.send_console_alert(message)
    puts  "[CONSOLE ALERT] : #{message}"
end
