env :PATH, '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin'

every :hour do
  runner 'DownloadFeedsJob.run'
end
