# path/to/your/config/puma.rb
on_worker_boot do
  MessageBus.after_fork
end