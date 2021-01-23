defmodule SamacareWeb.TweetView do
  use SamacareWeb, :view
  alias SamacareWeb.TweetView

  def render("index.json", %{tweets: tweets}) do
    %{data: render_many(tweets, TweetView, "tweet.json")}
  end

  def render("show.json", %{tweet: tweet}) do
    %{data: render_one(tweet, TweetView, "tweet.json")}
  end

  def render("tweet.json", %{tweet: tweet}) do
    %{id: tweet.id,
      message: tweet.message,
      private: tweet.private,
      inserted_at: tweet.inserted_at}
  end
end
