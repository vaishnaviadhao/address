class TodoListsController < ApplicationController
    before_action :set_todo_list, only: [:show, :edit, :destroy]
    def index
        @todo_lists = TodoList.all
    end  
    def show
    @todo_list = TodoList.find_by(id: params[:id])
    end  
    def new
        @todo_list = TodoList.new
    end  
    def edit
    @todo_list = TodoList.find_by(id: params[:id])
    end  
    def create 
        @todo_list = TodoList.new(todo_list_params)
        respond_to do |format|
          if @todo_list.save
            format.html { redirect_to @todo_list, notice: 'Todo list was successfully created.' }
            format.json { render :show, status: :created, location: @todo_list }
          else
            format.html { render :new }
          end
        end
      end
      def update
      @todo_list = TodoList.find_by(id: params[:id])
        respond_to do |format|
          if @todo_list.update(todo_list_params)
            format.html { redirect_to @todo_list, notice: 'Todo list was successfully updated.' }
            
          else
            format.html { render :edit }
            
          end
        end
      end   
      def destroy
        @todo_list.destroy
        respond_to do |format|
          format.html { redirect_to todo_lists_url, notice: 'Todo list was successfully destroyed.' }
        end
      end     
  def todo_list_params
        params.require(:todo_list).permit(:title, :description)
    end  
    private
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end
    def todo_list_params
      params.require(:todo_list).permit(:title, :description)
    end
end 


    
