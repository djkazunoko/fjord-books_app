class Books::CommentsController < CommentsController  
  before_action :set_commentable, only: %i[create destroy edit update]

  private  
    def set_commentable  
      @commentable = Book.find(params[:book_id])  
    end

    def render_commentable_show
      @book = @commentable
      render 'books/show'
    end
end  
