class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_note, only: %i[update destroy edit]

  def index
    @notes = Note.where(user: current_user).includes(:user, :city, :weather_report, :covid_report).page(params[:page]).per(5)
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(params.require(:note).permit(:city_id, :content, :travelled_at).merge!({ user: current_user }))
    @note.set_reports
    @note.save
    @note.errors.empty? ? flash[:success] = 'Note created' : flash[:error] = @note.errors.full_messages.to_sentence.to_s
    redirect_to root_path
  end

  def edit
    @note
  end

  def update
    @note.update(params.require(:note).permit(:city, :content, :travelled_at))
    @note.errors.empty? ? flash[:success] = 'Note updated' : flash[:error] = @note.errors.full_messages.to_sentence.to_s
    redirect_to root_path
  end

  def destroy
    @note.destroy
    @note.destroyed? ? flash[:success] = 'Note deleted' : flash[:error] = 'Could not delete note'
    redirect_to root_path
  end

  private

  def load_note
    @note = Note.find_by(user_id: current_user.id, id: params[:id])
  end

end