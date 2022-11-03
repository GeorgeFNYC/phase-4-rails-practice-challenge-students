class StudentsController < ApplicationController

    def create
        new_student = Student.create(student_params)
        render json: new_student, status: :created
    end

    def index
        students = Student.all
        render json: students
    end

    def update
        update_student = Student.find_by(id: params[:id])
        update_student.update(student_params)
        render json: update_student
    end

    def destroy
        delete_student = Student.find(params[:id])
        delete_student.destroy
        head :no_content
    end

    private

    def student_params
        params.permit(:name, :major, :age, :instructor_id)
    end

end
