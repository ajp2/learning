class NotesController < ApplicationController
  def create
    full_note = note_params
    full_note[:user_id] = current_user.id
    Note.create(full_note)

    redirect_to track_url(params[:note][:track_id])
  end

  def destroy
    note = Note.find(params[:id])
    if current_user.id == note.user_id
      note.destroy
      redirect_to track_url(note.track)
    else
      render text: "Cannot delete another user's note", status: :forbidden
  end

  private
  def note_params
    params.require(:note).permit(:info, :track_id)
  end
end