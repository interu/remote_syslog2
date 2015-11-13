template "/etc/log_files.yml" do
  source "log_files.yml.erb"
  mode "0644"
  group "root"
  owner "root"
end

template "/etc/init.d/remote_syslog" do
  source "remote_syslog.init.d.erb"
  mode "0755"
  group "root"
  owner "root"
end

include_recipe "remote_syslog::service"

service "remote_syslog" do
  action [ :enable, :start ]
end
