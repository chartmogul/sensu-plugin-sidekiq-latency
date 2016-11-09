#! /usr/bin/env ruby
# encoding: UTF-8

require 'sensu-plugin/check/cli'
require 'sidekiq/api'
require 'open-uri'
require 'json'

#   check-sidekiq-latency
#
# DESCRIPTION:
#   Checks a particular sidekiq queue for maximum latency
#
#     https://github.com/chartmogul/sensu-plugin-sidekiq-latency
#
#   Returns warning/critical if latency exceeds certain thresholds
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: sidekiq
#   gem: sensu-plugin
#   gem: open-uri
#   gem: json
#
# LICENSE:
#   Jason Langenauer <jason@chartmogul.com>
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#
class SidekiqLatencyCheck < Sensu::Plugin::Check::CLI
  option :redis_url,
         short: '-u URL',
         long: '--url URL',
         description: 'Redis URL to query',
         required: true

   option :queue,
          short: '-q QUEUE',
          long: '--queue QUEUE',
          description: 'Queue with latency to check',
          required: true

   option :warn,
          short: '-w SECONDS',
          long: '--warn SECONDS',
          description: 'Warn after any job has been SECONDS seconds in the queue',
          proc: proc { |seconds| seconds.to_i },
          default: 120

   option :crit,
          short: '-c SECONDS',
          long: '--crit SECONDS',
          description: 'Critical after any job has been SECONDS seconds in the queue',
          proc: proc { |seconds| seconds.to_i },
          default: 300

   def run
     begin
       Sidekiq.configure_client do |sidekiq_config|
        sidekiq_config.redis = { url: config[:url] }
       end

       latency = Sidekiq::Queue.new(config[:queue]).latency.to_i

       if latency > config[:warn]
         warning "The latency of Sidekiq queue '#{config[:queue]}' is more than #{config[:warn]} seconds"
       elsif latency > config[:crit]
         critical "The latency of Sidekiq queue '#{config[:queue]}' is more than #{config[:crit]} seconds"
       end

       ok "Maximum latency for Sidekiq queue '#{config[:queue]}' is less than #{config[:warn]} seconds"

     rescue => error
        unknown "Could not load Sidekiq stats from #{config[:url]}. Error: #{error}"
     end
   end
end
