alias ExDebugToolbarDemo.{User, Article, Video, Repo}

user = Repo.insert! %User{name: "Morty"}
Repo.insert! %Video{url: "https://www.youtube.com/watch?v=lZi5FaGLhCA", user: user}
Repo.insert! %Article{title: "7 Morty Meltdowns", user: user}
