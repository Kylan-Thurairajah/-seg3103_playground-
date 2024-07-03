defmodule Grades.Calculator do
  def average(a) do
    if Enum.count(a) == 0 do
      0
    else
      Enum.sum(a) / Enum.count(a)
    end
  end

  def failed_to_participate(avg_homework, avg_exams, avg_labs, num_labs, midterm, final, type) do
    if avg_homework < 0.4 || avg_exams < 0.4 || num_labs < 3 do
      if type == "letter" do
        "EIN"
      else
        0
      end
    else
      mark = calculate_grade(avg_labs, avg_homework, midterm, final)
      if type == "letter" do
        cond do
          mark > 0.895 -> "A+"
          mark > 0.845 -> "A"
          mark > 0.795 -> "A-"
          mark > 0.745 -> "B+"
          mark > 0.695 -> "B"
          mark > 0.645 -> "C+"
          mark > 0.595 -> "C"
          mark > 0.545 -> "D+"
          mark > 0.495 -> "D"
          mark > 0.395 -> "E"
          :else -> "F"
        end
      else
        cond do
          mark > 0.895 -> 10
          mark > 0.845 -> 9
          mark > 0.795 -> 8
          mark > 0.745 -> 7
          mark > 0.695 -> 6
          mark > 0.645 -> 5
          mark > 0.595 -> 4
          mark > 0.545 -> 3
          mark > 0.495 -> 2
          mark > 0.395 -> 1
          :else -> 0
        end
      end
    end
  end

  def percentage_grade(%{homework: homework, labs: labs, midterm: midterm, final: final}) do
    avg_homework = average(homework)
    avg_labs = average(homework)

    mark = 0.2 * avg_labs + 0.3 * avg_homework + 0.2 * midterm + 0.3 * final
    round(mark * 100)
  end

  def letter_grade(%{homework: homework, labs: labs, midterm: midterm, final: final}) do
    avg_homework = average(homework)
    avg_labs = average(homework)


    avg_exams = (midterm + final) / 2

    num_labs =
      labs
      |> Enum.reject(fn mark -> mark < 0.25 end)
      |> Enum.count()

    failed_to_participate(avg_homework, avg_exams, avg_labs, num_labs, midterm, final, "letter")

  end

  def numeric_grade(%{homework: homework, labs: labs, midterm: midterm, final: final}) do
    avg_homework = average(homework)
    avg_labs = average(homework)

    avg_exams = (midterm + final) / 2

    num_labs =
      labs
      |> Enum.reject(fn mark -> mark < 0.25 end)
      |> Enum.count()

    failed_to_participate(avg_homework, avg_exams, avg_labs, num_labs, midterm, final, "numeric")

  end
end
