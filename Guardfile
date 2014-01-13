notification :gntp

default_guard_options = {
  all_after_pass: false,
  all_on_start: false
}

guard :bundler, default_guard_options do
  watch('Gemfile')
end

guard :rspec, default_guard_options.merge(cli: '--color --format nested') do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^recipes/(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }
end
