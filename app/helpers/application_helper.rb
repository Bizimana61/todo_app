module ApplicationHelper
  # Return a human-friendly long date/time string for a due_date.
  # Accepts Date/Time/ActiveSupport::TimeWithZone or String values (robust parsing).
  # If parsing fails we fall back to the original value.
  def formatted_due_date(due_date)
    return nil if due_date.blank?

    dt =
      case due_date
      when ActiveSupport::TimeWithZone, Time, Date, DateTime
        # keep as-is
        due_date
      when String
        # try to parse string to time in current zone
        begin
          Time.zone.parse(due_date)
        rescue StandardError
          nil
        end
      else
        # try to coerce unknown objects to string then parse
        begin
          Time.zone.parse(due_date.to_s)
        rescue StandardError
          nil
        end
      end

    # If we successfully got a Time-like object, localize it, otherwise show raw value
    if dt.present?
      I18n.l(dt, format: :long) rescue dt.to_s
    else
      due_date.to_s
    end
  end
end