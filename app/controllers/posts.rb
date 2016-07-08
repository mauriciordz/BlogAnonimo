post '/write_post' do 
  a = params[:title]
  b = params[:content]
  c = params[:tags]
  post = Post.create(title: a, description: b)
  c_array = c.split(",")
  c_array.each do |c|
    post.tags << Tag.create(name: c)
  end 
  erb :index
end

get '/show_all_posts' do 
  @all = Post.all
  erb :all_posts
end

get '/show_a_post' do 
  id = params[:post_id]
  unless Post.where(id: id).empty?
    @post = Post.find(id)
  else
    @post = 1
  end
  erb :a_post
end

get '/edit_a_post' do 
  id = params[:post_id]
  title = params[:title]
  description = params[:description]
  unless Post.where(id: id).empty?
    @post = Post.find(id)
    @post.update(title: title, description: description)
  else
    @post = 1
  end
  erb :edited_post
end
