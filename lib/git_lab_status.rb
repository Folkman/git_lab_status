require 'git_lab_status/version'
require 'open-uri'

module GitLabStatus


  # Returns average response time rounded to two decimals
  # Accepts interval and total_time for purpose of testing
  def self.home_page_resp(interval=10, total_time=60)
    first_check = true
    resp_times = []
    start_minute = Time.now
    start_load_time = start_minute

    loop do
      if first_check || Time.now - start_load_time >= interval
        start_load_time = Time.now
        open('https://gitlab.com')
        load_time = Time.now - start_load_time
        resp_times << load_time
      end

      first_check = false

      break if Time.now - start_minute >= total_time
    end

    resp_times.reduce(:+).fdiv(resp_times.size).round(2)
  end


end
