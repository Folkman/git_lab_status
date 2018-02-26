require 'git_lab_status/version'
require 'open-uri'

module GitLabStatus

  @interval   = 10
  @total_time = 60


  def self.home_page_resp
    page_resp('https://gitlab.com')
  end


  def self.about_page_resp
    page_resp('https://about.gitlab.com')
  end


private


  def self.interval
    @interval
  end


  def self.total_time
    @total_time
  end


  def self.page_resp(url)
    print "Checking \"#{url}\" response time. Please wait #{total_time} seconds."

    resp_times = []
    start_minute = Time.now

    loop do
      start_load_time = Time.now
      open(url)
      load_time = Time.now - start_load_time
      resp_times << load_time

      print '.'

      sleep_time = interval - load_time
      sleep sleep_time if sleep_time > 0

      break if Time.now - start_minute >= total_time
    end

    avg_time = resp_times.reduce(:+).fdiv(resp_times.size).round(2)

    puts
    puts "Average response time: #{avg_time} seconds"

    avg_time
  end


end
