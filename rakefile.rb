  desc "test rspec"
  task :test_rspec do
    puts "Start rspec tests============================================"
    sh "rspec -I lib test/tc_rspec.rb"
  end

  desc "test shoulda"
  task :test_shoulda do
    puts "Start shoulda tests=========================================="
    sh "ruby -I lib test/tc_shoulda.rb"
  end
 
  task :default => [:test_rspec, :test_shoulda]
