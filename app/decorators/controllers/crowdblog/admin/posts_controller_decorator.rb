module Crowdblog
  module Admin
    PostsController.class_eval do
      def update
        binding.pry
        puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> aio"
      end

      private
      def post_params
        puts '>>>>>>>>>>>>>>>>>>>>>>>>'
        params.require(:post).permit(:title, :body, :cintillo, :resumen, :updated_by, :ready_for_review, :transition)
      end
    end
  end
end
