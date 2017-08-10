class Api::V1::MemosController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:index, :create, :destroy]

  def index
    @memos = Memo.all
    render json: @memos
  end

  def create
    memo = Memo.new(create_params)
    unless memo.save
      @error_message = [memo.errors.full_messages].compact
    end
  end

  def destroy
    @memo = Memo.find(params[:id])
    if @memo.destroy
      render
    else
      render json: {
          message: 'Unprocessable Memo',
          errors: @memo.errors.full_messages
      }, status: 422
    end
  end

  private

  def create_params
    params.permit(:text)
  end
end
