class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    # @task = Task.new(description: params[:task][:description], status: params[:task][:status])
    
    # evita códigos maliciosos
    @task = Task.new(params.require(:task).permit(:description, :status))
    if @task.save # redireciona para root se for possível salvar
      redirect_to root_path
    else 
      render :new # retorna os erros na própria página de criação
    end
  end

  def edit
    # utilizamos o params, dando uma olhada no routes vemos o nome do parâmetro na Rota de edit.
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(params.require(:task).permit(:description, :status))

    if @task.save # redireciona para root se for possível salvar
      redirect_to root_path
    else 
      render :new # retorna os erros na própria página de criação
    end
  end

  def destroy
    task = Task.find(params[:id]) # não precisamos de @ pois não temos view que usará esse objeto
    task.destroy #destrói a tarefa encontrada
    redirect_to root_path
  end
end