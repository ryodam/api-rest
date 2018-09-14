class DepartmentController < ApplicationController
    before_action :set_department, only: [:show, :update, :destroy]

    def index
        @departments = Department.all
    end

    def create
        @department = Department.new(department_params)
        if @department.save
            render :show, status: :created, location: @department
        else
            render json: @department.errors, status: :unprocessable_entity
        end
    end

    private
        def set_department
            @department = Department.find(params[:id])
        end
        def department_params
            params.require(:department).permit(:code, :name)
        end
end
