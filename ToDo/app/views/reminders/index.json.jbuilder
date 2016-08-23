json.reminders @finished
json.reminder @unfinished


json.array! @finished do |fin|
json.extract! fin, :id, :title, :description , :due_date , :priority , :finished
end

json.array! @unfinished do |unfin|
json.extract! unfin, :id, :title, :description , :due_date , :priority , :finished
end