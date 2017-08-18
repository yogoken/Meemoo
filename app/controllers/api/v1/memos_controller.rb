class Api::V1::MemosController < Api::ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:index, :create, :destroy]

  def index
    @memos = Memo.all
  end

  def create
    Memo.create!(create_params)
  rescue
    render json: {
        message: 'Unprocessable Memo',
        errors: @memo.errors.full_message
    }, status: 422
  end

  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy!
  rescue
    render json: {
        message: 'Unprocessable Memo',
        errors: @memo.errors.full_messages
    }, status: 422
  end

  private

  def create_params
    params.permit(:text)
  end
end
