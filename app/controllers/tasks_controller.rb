# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    authorize_action

    tasks = Task.includes(:tags)
    render :index, status: :ok, locals: { tasks: tasks }
  end

  def show
    authorize_action(task)

    render :show, status: :ok, locals: { task: task }
  end

  def create
    authorize_action

    task = Task.new(task_params)
    if task.save
      redirect_to tasks_path
    else
      render status: :unprocessable_entity, json: { errors: task.errors }
    end
  end

  def update
    authorize_action(task)

    if task.update(task_params)
      redirect_to task_path(task)
    else
      render status: :unprocessable_entity, json: { errors: task.errors }
    end
  end

  def destroy
    authorize_action(task)

    if task.destroy
      redirect_to tasks_path
    else
      render status: :unprocessable_entity, json: { errors: task.errors }
    end
  end

  private

  def task
    @task ||= Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(
      :title,
      taggings_attributes: [
        :id, :taggable_id, :taggable_type, { tag_attributes: %i[id name] }
      ]
    )
  end

  def authorize_action(record = Task)
    authorize(record, "#{action_name}?", policy_class: policy_class)
  end

  def policy_class
    TaskPolicy
  end
end
