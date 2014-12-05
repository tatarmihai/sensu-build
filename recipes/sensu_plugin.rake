Bunchr::Software.new do |t|
  t.name = 'sensu-plugin'

  t.version = '1.1.0'

  t.download_commands << "git clone https://github.com/tatarmihai/#{t.name}.git"

  gem_bin = File.join(Bunchr.install_dir, 'embedded', 'bin', 'gem')
  t.work_dir = "#{t.download_dir}/#{t.name}"
  t.build_commands << "rm -f sensu-*.gem"
  t.build_commands << "git checkout v#{t.version}.patched.sensu-agent-discovery"
  t.build_commands << "#{gem_bin} build #{t.name}.gemspec"

  t.install_commands << "#{gem_bin} install -v #{t.version} --no-ri --no-rdoc sensu-*.gem"

  CLEAN << Bunchr.install_dir
end
