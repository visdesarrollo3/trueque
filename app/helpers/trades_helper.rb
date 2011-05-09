module TradesHelper
  def grade_options
    (1..5).map do |grade|
      [grade, grade]
    end
  end
  
  def other_users_score(trade)
    user = trade.other_user(current_user)
    begin
      "El puntaje de <strong>#{user.name_or_login}</strong> fue de <strong>#{trade.score_from(user)}</strong>.".html_safe
    rescue Exception => e
      "<strong>#{user.name_or_login}</strong> no ha calificado este trueque.".html_safe
    end
  end
  
  
end
