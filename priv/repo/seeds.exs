alias ExDebugToolbarDemo.{User, Article, Video, Image, ImageSource, Repo}

[Article, Video, Image, ImageSource, User] |> Enum.each(&Repo.delete_all/1)
Repo.query("ALTER SEQUENCE users_id_seq RESTART")
user = Repo.insert! %User{name: "Morty"}
Repo.insert! %Video{url: "https://www.youtube.com/watch?v=lZi5FaGLhCA", user: user}
Repo.insert! %Article{title: "7 Morty Meltdowns", user: user}
image_source = Repo.insert! %ImageSource{}
Repo.insert! %Image{user: user, image_source: image_source}
