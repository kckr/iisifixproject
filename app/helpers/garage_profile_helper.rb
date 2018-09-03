module GarageProfileHelper
  def open_days_checkboxes_for(garage, state_checked: true, form_prefix: 'garage', label_class: '', display_block: false)
    days = Date::ABBR_DAYNAMES.map(&:downcase)

    days.map do |day|
      check_box_state = garage.open_days.include?(day) || (state_checked && garage.open_days.empty? && Config::WeekDays.include?(day)) ? true : false
      check_box_for_ day, label_class: label_class, active: check_box_state

    end.join.html_safe
  end

  def star_color_class_for(score, index)
    index <  score ? 'gold' : 'dark-grey'
  end

  private

  def check_box_for_(day, active: false, form_prefix: 'garage', label_class: '')
    item_name    = "#{form_prefix}[open_days][#{day}]"
    active_class = active ? 'active' : nil

    label_tag item_name, { class: "btn btn-primary #{active_class} #{label_class}" } do
      concat day.capitalize
      concat check_box_tag item_name, 1, active
    end
  end
end
