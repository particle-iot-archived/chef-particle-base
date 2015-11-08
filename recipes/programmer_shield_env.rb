# create a .env file that contains all of the key env variables that other scripts use
template "#{node['particle']['programmer_shield']['shared_dir']}/.env" do
  source "dot_env.sh.erb"
end

# put in the place that makes these env vars globally available to all shells
link "/etc/profile.d/particle-programmer-shield-env-vars.sh" do
  to "#{node['particle']['programmer_shield']['shared_dir']}/.env"
end

# file "/etc/profile.d/add-wrapper-scripts-to-path.sh" do
#   content <<-EOS
# export PATH="/particle/programmer-shield/current/photon-shields/programmer-shield/bin:$PATH"
# EOS
# end
