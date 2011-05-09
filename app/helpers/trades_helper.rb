module TradesHelper
  def grade_options
    (1..5).map do |grade|
      [grade, grade]
    end
  end
end
