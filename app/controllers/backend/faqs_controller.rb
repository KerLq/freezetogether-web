# frozen_string_literal: true

module Backend
  class FaqsController < Backend::BackendController
    def index
      controller_authorize(Faq)

      @faqs = Faq.all.order('id DESC')
    end

    def show
      controller_authorize(faq)
    end

    def new
      controller_authorize(Faq)

      @faq = Faq.new
    end

    def edit
      controller_authorize(faq)
    end

    def create
      controller_authorize(Faq)

      faq = Faq.new(permitted_attributes(Faq))

      if faq.save
        redirect_to edit_backend_faqs_path, flash: { success: t('.success') }
      else
        redirect_to new_backend_faq_path, flash: { error: t('.failed') }
      end
    end

    def update
      controller_authorize(faq)

      if @faq.update(permitted_attributes(faq))
        redirect_to edit_backend_faq_path(faq), flash: { success: t('.success') }
      else
        redirect_to edit_backend_faq_path(faq), flash: { error: t('.failed') }
      end
    end

    def destroy
      controller_authorize(faq)
      if faq.destroy
        redirect_to backend_faqs_path, flash: { success: t('.success') }
      else
        redirect_to backend_faqs_path, flash: { error: t('.failed') }
      end
    end

    private

    def faq
      @faq ||= Faq.find_by(id: params[:id])
    end
  end
end
