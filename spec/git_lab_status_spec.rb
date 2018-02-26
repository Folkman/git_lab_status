RSpec.describe GitLabStatus do

  it "has a version number" do
    expect(GitLabStatus::VERSION).not_to be nil
  end


  it "gives the average response time every ten seconds for one minute for https://gitlab.com" do
    allow(GitLabStatus).to receive(:open) { sleep 0.05 } # Simulate response time
    expect(GitLabStatus.home_page_resp(0.1, 1)).to eq(0.05)
  end


end
