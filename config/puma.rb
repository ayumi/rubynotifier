workers Integer(ENV["PUMA_WORKERS"] || 5)
threads Integer(ENV["PUMA_THREADS_MIN"] || 1), Integer(ENV["PUMA_THREADS"] || 1)
preload_app!

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end