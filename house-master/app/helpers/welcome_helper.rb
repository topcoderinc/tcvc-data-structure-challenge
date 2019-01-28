module WelcomeHelper
  def checklist(current_user)
    if current_user
      content_tag(
        :h3,
        link_to('Checklist', todo_lists_path)
      )
    else
      content_tag(
        :h3,
        'Checklist'
      )
    end
  end

  def calc(current_user)
    if current_user
      content_tag(
        :h3,
        link_to('Calculate New Payment', new_user_house_path(current_user.id))
      )
    else
      content_tag(
        :h3,
        'Calculate Mortgage Payments'
      )
    end
  end

  def tips(current_user)
    if current_user
      content_tag(
        :h3,
        link_to('Tips to buying a new house', welcome_lists_path)
      )
    else
      content_tag(
        :h3,
        'Tips to buying a new house'
      )
    end
  end

end
