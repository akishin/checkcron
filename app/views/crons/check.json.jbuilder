json.input_str @format_str
json.status @status
unless @status == "error"
  json.calculated_date I18n.l(@cron.date)
  json.last I18n.l(@cron.last)
  json.next @cron.next.each do |n|
    json.date I18n.l(n)
  end
else
  json.message @message
end
