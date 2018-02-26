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
    first_check = true
    resp_times = []
    start_minute = Time.now
    start_load_time = start_minute

    loop do
      if first_check || (Time.now - start_load_time) >= interval
        start_load_time = Time.now
        open(url)
        load_time = Time.now - start_load_time
        resp_times << load_time
        print '.'
      end

      first_check = false

      break if Time.now - start_minute >= total_time
    end

    puts

    resp_times.reduce(:+).fdiv(resp_times.size).round(2)
  end


end
