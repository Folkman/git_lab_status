RSpec.describe GitLabStatus do

  it "has a version number" do
    expect(GitLabStatus::VERSION).not_to be nil
  end


  context "methods" do
    before(:each) do
      # Shorten the interval and total_time for testing
      allow(GitLabStatus).to receive(:interval).and_return(0.1)
      allow(GitLabStatus).to receive(:total_time).and_return(0.3)
    end


    it "gives the average response time every ten seconds for one minute for https://gitlab.com" do
      allow(GitLabStatus).to receive(:open) { sleep 0.05 } # Simulate response time
      expect(GitLabStatus.home_page_resp).to eq(0.05)
    end


    it "gives the average response time every ten seconds for one minute for https://about.gitlab.com" do
      allow(GitLabStatus).to receive(:open) { sleep 0.07 } # Simulate response time
      expect(GitLabStatus.about_page_resp).to eq(0.07)
    end
  end


end
