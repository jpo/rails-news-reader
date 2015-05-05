require 'feedzirra'

class DownloadFeedsJob
  def self.run
    Feed.all.each do |destination|
      Feedzirra::Feed.fetch_and_parse(
        destination.url, 
        on_success: ->(url, feed) { self.cache_feed(feed, destination) },
        on_failure: ->(url, response_code, response_header, response_body) { self.log_error(destination) })
    end
  end

  private

  def self.cache_feed(source, destination)
    Rails.logger.info "[DownloadFeedsJob] Deleting entries for [#{destination.title}]"
    destination.entries.destroy_all

    Rails.logger.info "[DownloadFeedsJob] Adding entries for [#{destination.title}]"
    source.entries.each do |entry|
      destination.entries.create({
          title:     entry.title,
          url:       entry.url,
          summary:   entry.summary,
          published: entry.published
        })
    end
  end

  def self.log_error(feed)
    Rails.logger.error "[DownloadFeedsJob] Failed to download feed: #{feed.url}"
  end
end