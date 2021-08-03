module Authors
  class ElementsController < AuthorsController
    before_action :set_post
    before_action :set_element, only: %i[ show edit update destroy ]

    # GET /elements or /elements.json
    def index
      @elements = Element.all
    end

    # GET /elements/1 or /elements/1.json
    def show
    end

    # GET /elements/new
    def new
      @element = Element.new
    end

    # GET /elements/1/edit
    def edit
    end

    # POST /elements or /elements.json
    def create
      @element = @post.elements.build(element_params)
      @element.post_id = @post.id 

      if @element.save
        notice = nil
      else
        notice = @element.errors.full_messages.loin(". ") << "."
      end
      redirect_to edit_post_path(@post)
    end

    # PATCH/PUT /elements/1 or /elements/1.json
    def update
      @element.update(element_params)

      respond_to do |format|
        format.html { redirect_to edit_post_path(@post) }
        format.json { head :no_content }
        format.js { }
      end
    end

    # DELETE /elements/1 or /elements/1.json
    def destroy
      @element.destroy
      respond_to do |format|
        format.html { redirect_to edit_post_path(@element.post), notice: "Element was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

      def set_post
        @post = current_author.posts.find(params[:post_id])
      end
      # Use callbacks to share common setup or constraints between actions.
      def set_element
        @element = Element.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def element_params
        params.require(:element).permit(:element_type, :position, :content, :image, :element_video)
      end
  end

end