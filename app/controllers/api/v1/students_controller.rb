class Api::V1::StudentsController < ApplicationController
    def index
        @students = Student.order('created_at DESC');
        render json: {status: 'SUCCESS', message: 'Loaded student detail',data: @students},status: :ok
    end
    def show
        @student = Student.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded student detail',data: @student},status: :ok
    end
    def create
        @student = Student.new(student_params)
        if @student.save
            render json: {status: 'SUCCESS', message: 'Saved  student detail', data: @student},status: :ok
        else
            render json: {status: 'ERROR', message: 'Cannot save student detail', data: @student},status: :unprocessable_entity 
        end
    end
    def update
        @student = Student.find(params[:id])
        if @student.update(student_params)
            render json: {status: 'SUCCESS', message: 'updated  student detail', data: @student},status: :ok
        else
            render json: {status: 'ERROR', message: 'Cannot update student detail', data: @student},status: :unprocessable_entity 
        end
    end
    def destroy
        @student = Student.find(params[:id])
        if @student.destroy
            render json: {status: 'SUCCESS', message: 'Deleted  student details', data: @student},status: :ok
        else 
            render json: {status: 'ERROR', message: 'Saved  student detail', data: @student},status: :unprocessable_entity 
        end

    end
    private

    def student_params
        params.require(:student).permit(:name, :class, :roll_no, :school)
    end
end
