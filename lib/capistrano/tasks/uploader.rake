namespace :upload do
  desc 'Upload shared files to the server'
  task :yml_files do
    on roles(:web) do |host|
      fetch(:linked_files).each do |common_file|
        upload! common_file, "#{fetch(:deploy_to)}/shared/#{common_file}"
      end
    end
  end
end
