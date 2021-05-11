require 'rails_helper'

RSpec.describe "Notes", type: :request do

  before(:each) do
    stub_api_requests
  end

  describe "GET /notes" do

    context "when user is logged in" do

      before(:each) do
        mock_sign_in
      end

      it "should render index of notes" do
        get notes_path
        expect(response.body).to include "Travel notes"
      end

    end

    context "when user is not logged in" do
      it "should redirect to login page" do
        get notes_path
        follow_redirect!
        expect(response.body).to include "Sign in with Google"
      end
    end

  end

  describe "POST /notes" do

    context "when user is logged in" do
      before(:each) do
        mock_sign_in
      end

      it "should create a new note" do
        before = Note.count
        post notes_path, params: { note: { city_id: Fabricate(:city).id, content: "Test content", travelled_at: Date.today}}
        after = Note.count
        expect(before).to_not equal after
      end

    end

    context "when user is not logged in" do

      it "should redirect to login page" do
        post notes_path
        follow_redirect!
        expect(response.body).to include "Sign in with Google"
      end

    end
  end

  describe "GET /notes/new" do

    context "when user is logged in" do

      before(:each) do
        mock_sign_in
      end

      it "should render form for new note" do
        get new_note_path
        expect(response.body).to include "Add a new note"
      end

    end

    context "when user is not logged in" do

      it "should redirect to login page" do
        get new_note_path
        follow_redirect!
        expect(response.body).to include "Sign in with Google"
      end

    end
  end

  describe "GET notes/:id/edit" do

    context "when user is logged in" do

      before(:each) do
        mock_sign_in
      end

      it "should render form for editing note" do
        get edit_note_path(Fabricate(:note, user: @user))
        expect(response.body).to include "Edit a note"
      end

    end

    context "when user is not logged in" do

      it "should redirect to login page" do
        get edit_note_path(Fabricate(:note))
        follow_redirect!
        expect(response.body).to include "Sign in with Google"
      end

    end
  end

  describe "PATCH notes/:id" do

    context "when user is logged in" do

      before(:each) do
        mock_sign_in
      end

      it "should update a note" do
        note = Fabricate(:note, user: @user, content: "Text before")
        patch note_path(note), params: {note: { content: "Text after"}}
        expect(note.reload.content).to eq "Text after"
      end

    end

    context "when user is not logged in" do

      it "should redirect to login page" do
        note = Fabricate(:note, content: "Text before")
        patch note_path(note), params: {note: { content: "Text after"}}
        follow_redirect!
        expect(response.body).to include "Sign in with Google"
      end

    end
  end

  describe "DELETE notes/:id" do

    context "when user is logged in" do

      before(:each) do
        mock_sign_in
      end

      it "should delete a note" do
        delete note_path(Fabricate(:note, user: @user))
        expect(Note.count).to eq 0
      end

    end

    context "when user is not logged in" do

      it "should redirect to login page" do
        note = Fabricate(:note, content: "Text before")
        delete note_path(note)
        follow_redirect!
        expect(response.body).to include "Sign in with Google"
      end

    end
  end
end
