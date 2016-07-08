get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  erb :index
end






get '/delete_a_post' do 
  id = params[:id]
  unless Post.where(id: id).empty?
    @post = Post.find(id)
    @post.destroy
  else
    @post = 1
  end
  erb :deleted_post
end
