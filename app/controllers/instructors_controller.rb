class InstructorsController < ApplicationController

    def index
        instructors = Instructor.all
        render json: instructors
    end

    def create
        new_instructor = Instructor.create(instructor_params)
        render json: new_instructor, status: :created
    end

    def update
        updated_instructor = Instructor.find_by(id: params[:id])
        updated_instructor.update(instructor_params)
        render json: updated_instructor
    end

    def destroy
        delete_instructor = Instructor.find(params[:id])
        delete_instructor.destroy
        head :no_content
    end

    private

    def instructor_params
        params.permit(:name)
    end

end
