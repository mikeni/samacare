defmodule SamacareWeb.TweetController do
  use SamacareWeb, :controller

  alias Samacare.Posts
  alias Samacare.Posts.Tweet

  action_fallback SamacareWeb.FallbackController

  def index(conn, params) do
    tweets = Posts.list_tweets(params)
    render(conn, "index.json", tweets: tweets)
  end

  def create(conn, %{"tweet" => tweet_params}) do
    # tweet_params = Map.merge(tweet_params, %{"tweeted_at" => DateTime.utc_now})
    with {:ok, %Tweet{} = tweet} <- Posts.create_tweet(tweet_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.tweet_path(conn, :show, tweet))
      |> render("show.json", tweet: tweet)
    end
  end

  def show(conn, %{"id" => id}) do
    tweet = Posts.get_tweet!(id)
    render(conn, "show.json", tweet: tweet)
  end

  def update(conn, %{"id" => id, "tweet" => tweet_params}) do
    tweet = Posts.get_tweet!(id)

    with {:ok, %Tweet{} = tweet} <- Posts.update_tweet(tweet, tweet_params) do
      render(conn, "show.json", tweet: tweet)
    end
  end

  def delete(conn, %{"id" => id}) do
    tweet = Posts.get_tweet!(id)

    with {:ok, %Tweet{}} <- Posts.delete_tweet(tweet) do
      send_resp(conn, :no_content, "")
    end
  end
end
