def template(from, to)
  erb = File.read(File.expand_path("../templates/#{from}", __FILE__))
  put ERB.new(erb).result(binding), to
end

def set_default(name, *args, &block)
  set(name, *args, &block) unless exists?(name)
end

namespace :deploy do
  desc "Install everything onto the server"
  task :install do
    run "#{sudo} apt-get -y update"
    run "#{sudo} apt-get -y install python-software-properties"
    run "#{sudo} apt-get -y install curl"
    run "#{sudo} apt-get -y install build-essential zlib1g-dev git-core sqlite3 libsqlite3-dev libsqlite3-0"
    run "#{sudo} apt-get -y install libxslt-dev libxml2-dev"
    run "#{sudo} apt-get -y install libreadline-dev libreadline6 libreadline6-dev"
    run "#{sudo} apt-get -y install libssl-dev openssl"
    run "#{sudo} apt-get -y install libyaml-dev"
    run "#{sudo} apt-get -y install autoconf libc6-dev ncurses-dev automake libtool bison"
    run "#{sudo} apt-get -y install zlib1g zlib1g-dev"
    run "#{sudo} apt-get -y install fcgiwrap"
  end
end
