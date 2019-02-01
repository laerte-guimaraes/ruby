class TasksController < ApplicationController
  def new
  end

  def create
    # @task = Task.new(description: params[:task][:description], status: params[:task][:status])
    
    # evita códigos maliciosos
    @task = Task.new(params.require(:task).permit(:description, :status))
    @task.save # salva no banco a tarefa que criamos

    redirect_to root_path # retorna para o root
  end

  def edit
    # utilizamos o params, dando uma olhada no routes vemos o nome do parâmetro na Rota de edit.
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(params.require(:task).permit(:description, :status))
    redirect_to root_path
  end

  def destroy
    task = Task.find(params[:id]) # não precisamos de @ pois não temos view que usará esse objeto
    task.destroy #destrói a tarefa encontrada
    redirect_to root_path
  end
end