inbound  = schedules.find { |sched| sched[0]['Direction'] == '1' }
outbound = schedules.find { |sched| sched[0]['Direction'] != '1' }

json.inbound inbound.each do |inbound|
  json.day        inbound['day']
  json.date       inbound['DateCalender']
  json.direction  inbound['Direction']
  json.route      inbound['Route']
  json.stopName   inbound['StopName']
  json.time       inbound['date']
end

json.outbound outbound.each do |outbound|
  json.day        outbound['day']
  json.date       outbound['DateCalender']
  json.direction  outbound['Direction']
  json.route      outbound['Route']
  json.stopName   outbound['StopName']
  json.time       outbound['date']
end

json.alert do |json|
  json.advisoryMessage        alert.advisory_message
  json.currentMessage         alert.current_message
  json.detourEndTime          alert.detour_end_time
  json.detourMessage          alert.detour_message
  json.detourReason           alert.detour_reason
  json.detourStartLocation    alert.detour_start_location
  json.detourStartTime        alert.detour_start_time
  json.lastUpdated            alert.last_updated
end
