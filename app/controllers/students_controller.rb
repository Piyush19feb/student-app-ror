class StudentsController < ApplicationController
    before_action :set_student, only: [:show, :update, :destroy]
  
    # GET /students
    def index
      @students = Student.all
      render json: @students
    end
  
    # GET /students/:id
    def show
      render json: @student
    end
  
    # POST /students
    def create
      @student = Student.new(student_params)
  
      if @student.save
        render json: @student, status: :created
      else
        render json: @student.errors, status: :unprocessable_entity
      end
    end
  
    # PUT /students/:id
    def update
      if @student.update(student_params)
        render json: @student
      else
        render json: @student.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /students/:id
    def destroy
      @student.destroy
    end
  
    private
  
    # Set student for show, update, and destroy actions
    def set_student
      @student = Student.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through
    def student_params
      params.require(:student).permit(:name, :age, :email)
    end
  end
  