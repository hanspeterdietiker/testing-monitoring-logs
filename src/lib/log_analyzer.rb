require "time"

require_relative "../config/settings"
require_relative "notifier"

class LogAnalyzer
  attr_reader :status_counts, :ip_counts, :recent_5xx_errors

  def initialize 
    @status_counts =  Hash.new(0)
    @ip_counts =Hash.new(0)
    @recent_5xx_errors = []
    @last_alert_time= time.now - CONFIG [:alert_window_seconds]
  end