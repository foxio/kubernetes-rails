worker_processes Integer(ENV['WEB_CONCURRENCY'] || 5)
timeout 60
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end
end

working_directory "/my_project"

listen "/tmp/unicorn.sock", :backlog => 64

stderr_path "/my_project/log/unicorn.stderr.log"
stdout_path "/my_project/log/unicorn.stdout.log"
