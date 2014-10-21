require 'serverspec'

# Required by serverspec
set :backend, :exec

describe 'MySQL' do

  describe service("mysql") do
    it { should be_enabled }
    it { should be_running }
  end

  describe port("3306") do
    it { should be_listening }
  end

  describe command('service mysql status') do
    its(:stdout) { should match /mysql start\/running/ }
  end

  describe "can run MySQL queries on the server" do

    describe "'course_app' mysql user is created for localhost" do
      describe command(
        "echo \"SELECT User, Host FROM mysql.user\" | mysql --user=course_app --password=supersecret"
      ) do
        its(:stdout) { should match /course_app\tlocalhost/ }
      end
    end

    describe "'course_app_prod' database exists" do
      describe command(
        "echo \"SELECT DATABASES LIKE 'course_app_prod'\" | mysql --user=course_app --password=supersecret"
      ) do
        its(:stdout) { should match /course_app_prod/ }
      end
    end

  end

end