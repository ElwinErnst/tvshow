require "application_system_test_case"

class GeneresTest < ApplicationSystemTestCase
  setup do
    @genere = generes(:one)
  end

  test "visiting the index" do
    visit generes_url
    assert_selector "h1", text: "Generes"
  end

  test "creating a Genere" do
    visit generes_url
    click_on "New Genere"

    fill_in "Name", with: @genere.name
    click_on "Create Genere"

    assert_text "Genere was successfully created"
    click_on "Back"
  end

  test "updating a Genere" do
    visit generes_url
    click_on "Edit", match: :first

    fill_in "Name", with: @genere.name
    click_on "Update Genere"

    assert_text "Genere was successfully updated"
    click_on "Back"
  end

  test "destroying a Genere" do
    visit generes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Genere was successfully destroyed"
  end
end
