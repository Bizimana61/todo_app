module TodosHelper
  def days_until_due(todo)
    return nil unless todo.due_date.present?
    
    due = if todo.due_date.is_a?(String)
            Date.parse(todo.due_date)
          else
            todo.due_date.to_date
          end
    
    (due - Date.today).to_i
  end

  def urgency_class(todo)
    days = days_until_due(todo)
    return '' unless days
    
    if days < 0
      'overdue'
    elsif days == 0
      'due-today'
    elsif days == 1
      'due-tomorrow'
    elsif days <= 3
      'due-soon'
    else
      ''
    end
  end

  def urgency_message(todo)
    days = days_until_due(todo)
    return nil unless days
    
    if days < 0
      "#{days.abs} day#{'s' if days.abs != 1} overdue!"
    elsif days == 0
      "Due today!"
    elsif days == 1
      "Due tomorrow"
    elsif days <= 3
      "Due in #{days} days"
    else
      nil
    end
  end
end
