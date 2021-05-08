class PagesController < ApplicationController

  before_action :confirm_logged_in

  def index
    @pages = Page.order('position ASC')
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = 'Page created'
      redirect_to(pages_path)
    else
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update(page_params)
      flash[:notice] = 'Page updated'
      redirect_to(page_path(@page))
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = 'Page deleted'
    redirect_to(pages_path)
  end

  private

    def page_params
      params.require(:page).permit(
        :name,
        :visible,
        :position,
        :permalink,
        :content,
        :subject_id
      )
    end

end
