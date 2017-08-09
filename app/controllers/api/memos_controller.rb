class Api::MemosController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:index, :create]

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

  private

  def create_params
    params.permit(:text)
  end
end
