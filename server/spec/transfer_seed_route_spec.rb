
describe "GET /:name/version" do
  describe "when seed does not exist" do
    it "should respond with 404" do
      get '/invalid/9.9.9'
      last_response.status.should == 404
      last_response.body.should include('seed does not exist')
    end
  end
  
  describe "when seed version does not exist" do
    it "should respond with 404" do
      get '/oo/9.9.9'
      last_response.status.should == 404
      last_response.body.should include('seed version does not exist')
    end
  end
  
  describe "when seed and version exist" do
    it "should transfer seed tarball when :version exists" do
      get '/oo/1.2.0'
      last_response.should be_ok
      last_response.headers['Content-Type'].should == 'application/x-tar'
    end
  end
end