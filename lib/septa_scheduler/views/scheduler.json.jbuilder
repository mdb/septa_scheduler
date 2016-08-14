inbound  = schedules.find { |sched| sched[0]['Direction'] == '1' }
outbound = schedules.find { |sched| sched[0]['Direction'] != '1' }
view     = File.expand_path('../_stop.json.jbuilder', __FILE__)
template = Tilt::JbuilderTemplate.new(view)

json.stopName inbound.first['StopName']
json.inbound  inbound.map  { |inbound|  JSON.parse template.render(nil, stop: inbound) }
json.outbound outbound.map { |outbound| JSON.parse template.render(nil, stop: outbound) }

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
