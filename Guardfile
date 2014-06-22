guard :rspec, failed_mode: :keep do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
  watch('bin/gorobotgo')        { "spec/acceptance/cli_spec.rb" }
end
