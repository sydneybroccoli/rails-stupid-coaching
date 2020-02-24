require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  test "visiting /ask renders the form" do
    visit ask_url
    assert_selector "p", text: "ASK YOUR COACH ANYTHING..."
    take_screenshot
  end

  test "saying nothing yields nothing" do
    visit ask_url
    fill_in "question", with: ""
    click_on "ASK!"
    assert_selector "p#answer", text: "..."
    take_screenshot
  end

  test "saying 'hello' yields .." do
    visit ask_url
    fill_in "question", with: "hello"
    click_on "ASK!"
    assert_selector "p#answer", text: "I dont care, get dressed and go to work!"
    take_screenshot
  end

  test "asking a question yields.." do
    visit ask_url
    fill_in "question", with: "what time is it?"
    click_on "ASK!"
    assert_selector "p#answer", text: "Silly question, get dressed and go to work!"
    take_screenshot
  end

  test "asking 'I am going to work right now!' yields a good response" do
    visit ask_url
    fill_in "question", with: "I am going to work right now!"
    click_on "ASK!"
    assert_selector "p#answer", text: "Great!"
    take_screenshot
  end

  test "asking anything in UPCASE yields 'I like your motivation' before the response" do
    visit ask_url
    fill_in "question", with: "HELLO"
    click_on "ASK!"
    assert_selector "p#answer", text: "I can feel your motivation! I dont care, get dressed and go to work!"
    take_screenshot
  end
end
