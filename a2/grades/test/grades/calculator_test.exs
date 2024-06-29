defmodule Grades.CalculatorTest do
  use ExUnit.Case
  alias Grades.Calculator

  describe "percentage_grade/1" do
    test "TC1" do
      assert 45 ==
               Calculator.percentage_grade(%{
                 homework: [],
                 labs: [],
                 midterm: 0.9,
                 final: 0.9
               })
    end

    test "TC2" do
      assert 70 ==
               Calculator.percentage_grade(%{
                 homework: [0.5],
                 labs: [0.5],
                 midterm: 0.9,
                 final: 0.9
               })
    end
  end

  describe "letter_grade/1" do
    test "TC3" do
      assert "EIN" ==
               Calculator.letter_grade(%{
                 homework: [],
                 labs: [0.7,0.7,0.7,0.7],
                 midterm: 0.9,
                 final: 0.9
               })
    end

    test "TC4" do
      assert "EIN" ==
               Calculator.letter_grade(%{
                 homework: [0.7],
                 labs: [],
                 midterm: 0.9,
                 final: 0.9
               })
    end

    test "TC5" do
      assert "EIN" ==
               Calculator.letter_grade(%{
                 homework: [],
                 labs: [],
                 midterm: 0.9,
                 final: 0.9
               })
    end

    test "TC6" do
      assert "EIN" ==
               Calculator.letter_grade(%{
                 homework: [0.7],
                 labs: [0.7,0.7,0.7,0.7],
                 midterm: 0.2,
                 final: 0.2
               })
    end

    test "TC7" do
      assert "EIN" ==
               Calculator.letter_grade(%{
                 homework: [0.7],
                 labs: [],
                 midterm: 0.2,
                 final: 0.2
               })
    end

    test "TC8" do
      assert "EIN" ==
               Calculator.letter_grade(%{
                 homework: [],
                 labs: [0.7,0.7,0.7,0.7],
                 midterm: 0.2,
                 final: 0.2
               })
    end

    test "TC9" do
      assert "EIN" ==
               Calculator.letter_grade(%{
                 homework: [],
                 labs: [],
                 midterm: 0.2,
                 final: 0.2
               })
    end

    test "TC10" do
      assert "A+" ==
               Calculator.letter_grade(%{
                 homework: [0.95],
                 labs: [0.95,0.95,0.95,0.95],
                 midterm: 0.95,
                 final: 0.95
               })
    end

    test "TC11" do
      assert "A" ==
               Calculator.letter_grade(%{
                 homework: [0.9],
                 labs: [0.9,0.9,0.9,0.9],
                 midterm: 0.9,
                 final: 0.8
               })
    end

    test "TC12" do
      assert "A-" ==
               Calculator.letter_grade(%{
                 homework: [0.9],
                 labs: [0.9,0.9,0.9,0.9],
                 midterm: 0.7,
                 final: 0.8
               })
    end

    test "TC13" do
      assert "B+" ==
               Calculator.letter_grade(%{
                 homework: [0.9],
                 labs: [0.9,0.9,0.9,0.9],
                 midterm: 0.65,
                 final: 0.65
               })
    end

    test "TC14" do
      assert "B" ==
               Calculator.letter_grade(%{
                 homework: [0.8],
                 labs: [0.8,0.8,0.8,0.8],
                 midterm: 0.65,
                 final: 0.65
               })
    end

    test "TC15" do
      assert "C+" ==
               Calculator.letter_grade(%{
                 homework: [0.7],
                 labs: [0.7,0.7,0.7,0.7],
                 midterm: 0.65,
                 final: 0.65
               })
    end

    test "TC16" do
      assert "C" ==
               Calculator.letter_grade(%{
                 homework: [0.6],
                 labs: [0.6,0.6,0.6,0.6],
                 midterm: 0.65,
                 final: 0.65
               })
    end

    test "TC17" do
      assert "D+" ==
               Calculator.letter_grade(%{
                 homework: [0.55],
                 labs: [0.55,0.55,0.55,0.55],
                 midterm: 0.6,
                 final: 0.6
               })
    end

    test "TC18" do
      assert "D" ==
               Calculator.letter_grade(%{
                 homework: [0.5],
                 labs: [0.5,0.5,0.5,0.5],
                 midterm: 0.55,
                 final: 0.55
               })
    end

    test "TC19" do
      assert "E" ==
               Calculator.letter_grade(%{
                 homework: [0.41],
                 labs: [0.41,0.41,0.41,0.41],
                 midterm: 0.41,
                 final: 0.41
               })
    end

    test "TC20" do
      assert "F" ==
               Calculator.letter_grade(%{
                 homework: [0.41],
                 labs: [0.41,0.41,0.41,0.41],
                 midterm: 0.71,
                 final: 0.11
               })
    end
  end

  describe "numeric_grade/1" do
    test "TC21" do
      assert 0 ==
               Calculator.numeric_grade(%{
                 homework: [],
                 labs: [0.7,0.7,0.7,0.7],
                 midterm: 0.9,
                 final: 0.9
               })
    end

    test "TC22" do
      assert 0 ==
               Calculator.numeric_grade(%{
                 homework: [0.7],
                 labs: [],
                 midterm: 0.9,
                 final: 0.9
               })
    end

    test "TC23" do
      assert 0 ==
               Calculator.numeric_grade(%{
                 homework: [],
                 labs: [],
                 midterm: 0.9,
                 final: 0.9
               })
    end

    test "TC24" do
      assert 0 ==
               Calculator.numeric_grade(%{
                 homework: [0.7],
                 labs: [0.7,0.7,0.7,0.7],
                 midterm: 0.2,
                 final: 0.2
               })
    end

    test "TC25" do
      assert 0 ==
               Calculator.numeric_grade(%{
                 homework: [0.7],
                 labs: [],
                 midterm: 0.2,
                 final: 0.2
               })
    end

    test "TC26" do
      assert 0 ==
               Calculator.numeric_grade(%{
                 homework: [],
                 labs: [0.7,0.7,0.7,0.7],
                 midterm: 0.2,
                 final: 0.2
               })
    end

    test "TC27" do
      assert 0 ==
               Calculator.numeric_grade(%{
                 homework: [],
                 labs: [],
                 midterm: 0.2,
                 final: 0.2
               })
    end

    test "TC28" do
      assert 10 ==
               Calculator.numeric_grade(%{
                 homework: [0.95],
                 labs: [0.95,0.95,0.95,0.95],
                 midterm: 0.95,
                 final: 0.95
               })
    end

    test "TC29" do
      assert 9 ==
               Calculator.numeric_grade(%{
                 homework: [0.9],
                 labs: [0.9,0.9,0.9,0.9],
                 midterm: 0.9,
                 final: 0.8
               })
    end

    test "TC30" do
      assert 8 ==
               Calculator.numeric_grade(%{
                 homework: [0.9],
                 labs: [0.9,0.9,0.9,0.9],
                 midterm: 0.7,
                 final: 0.8
               })
    end

    test "TC31" do
      assert 7 ==
               Calculator.numeric_grade(%{
                 homework: [0.9],
                 labs: [0.9,0.9,0.9,0.9],
                 midterm: 0.65,
                 final: 0.65
               })
    end

    test "TC32" do
      assert 6 ==
               Calculator.numeric_grade(%{
                 homework: [0.8],
                 labs: [0.8,0.8,0.8,0.8],
                 midterm: 0.65,
                 final: 0.65
               })
    end

    test "TC33" do
      assert 5 ==
               Calculator.numeric_grade(%{
                 homework: [0.7],
                 labs: [0.7,0.7,0.7,0.7],
                 midterm: 0.65,
                 final: 0.65
               })
    end

    test "TC34" do
      assert 4 ==
               Calculator.numeric_grade(%{
                 homework: [0.6],
                 labs: [0.6,0.6,0.6,0.6],
                 midterm: 0.65,
                 final: 0.65
               })
    end

    test "TC35" do
      assert 3 ==
               Calculator.numeric_grade(%{
                 homework: [0.55],
                 labs: [0.55,0.55,0.55,0.55],
                 midterm: 0.6,
                 final: 0.6
               })
    end

    test "TC36" do
      assert 2 ==
               Calculator.numeric_grade(%{
                 homework: [0.5],
                 labs: [0.5,0.5,0.5,0.5],
                 midterm: 0.55,
                 final: 0.55
               })
    end

    test "TC37" do
      assert 1 ==
               Calculator.numeric_grade(%{
                 homework: [0.41],
                 labs: [0.41,0.41,0.41,0.41],
                 midterm: 0.41,
                 final: 0.41
               })
    end

    test "TC38" do
      assert 0 ==
               Calculator.numeric_grade(%{
                 homework: [0.41],
                 labs: [0.41,0.41,0.41,0.41],
                 midterm: 0.71,
                 final: 0.11
               })
    end
  end




end
