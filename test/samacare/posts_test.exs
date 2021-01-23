defmodule Samacare.PostsTest do
  use Samacare.DataCase

  alias Samacare.Posts

  describe "users" do
    alias Samacare.Posts.User

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Posts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Posts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Posts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Posts.create_user(@valid_attrs)
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Posts.update_user(user, @update_attrs)
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_user(user, @invalid_attrs)
      assert user == Posts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Posts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Posts.change_user(user)
    end
  end

  describe "follows" do
    alias Samacare.Posts.Follow

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def follow_fixture(attrs \\ %{}) do
      {:ok, follow} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Posts.create_follow()

      follow
    end

    test "list_follows/0 returns all follows" do
      follow = follow_fixture()
      assert Posts.list_follows() == [follow]
    end

    test "get_follow!/1 returns the follow with given id" do
      follow = follow_fixture()
      assert Posts.get_follow!(follow.id) == follow
    end

    test "create_follow/1 with valid data creates a follow" do
      assert {:ok, %Follow{} = follow} = Posts.create_follow(@valid_attrs)
    end

    test "create_follow/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_follow(@invalid_attrs)
    end

    test "update_follow/2 with valid data updates the follow" do
      follow = follow_fixture()
      assert {:ok, %Follow{} = follow} = Posts.update_follow(follow, @update_attrs)
    end

    test "update_follow/2 with invalid data returns error changeset" do
      follow = follow_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_follow(follow, @invalid_attrs)
      assert follow == Posts.get_follow!(follow.id)
    end

    test "delete_follow/1 deletes the follow" do
      follow = follow_fixture()
      assert {:ok, %Follow{}} = Posts.delete_follow(follow)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_follow!(follow.id) end
    end

    test "change_follow/1 returns a follow changeset" do
      follow = follow_fixture()
      assert %Ecto.Changeset{} = Posts.change_follow(follow)
    end
  end

  describe "follows" do
    alias Samacare.Posts.Follow

    @valid_attrs %{deleted_at: ~N[2010-04-17 14:00:00]}
    @update_attrs %{deleted_at: ~N[2011-05-18 15:01:01]}
    @invalid_attrs %{deleted_at: nil}

    def follow_fixture(attrs \\ %{}) do
      {:ok, follow} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Posts.create_follow()

      follow
    end

    test "list_follows/0 returns all follows" do
      follow = follow_fixture()
      assert Posts.list_follows() == [follow]
    end

    test "get_follow!/1 returns the follow with given id" do
      follow = follow_fixture()
      assert Posts.get_follow!(follow.id) == follow
    end

    test "create_follow/1 with valid data creates a follow" do
      assert {:ok, %Follow{} = follow} = Posts.create_follow(@valid_attrs)
      assert follow.deleted_at == ~N[2010-04-17 14:00:00]
    end

    test "create_follow/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_follow(@invalid_attrs)
    end

    test "update_follow/2 with valid data updates the follow" do
      follow = follow_fixture()
      assert {:ok, %Follow{} = follow} = Posts.update_follow(follow, @update_attrs)
      assert follow.deleted_at == ~N[2011-05-18 15:01:01]
    end

    test "update_follow/2 with invalid data returns error changeset" do
      follow = follow_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_follow(follow, @invalid_attrs)
      assert follow == Posts.get_follow!(follow.id)
    end

    test "delete_follow/1 deletes the follow" do
      follow = follow_fixture()
      assert {:ok, %Follow{}} = Posts.delete_follow(follow)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_follow!(follow.id) end
    end

    test "change_follow/1 returns a follow changeset" do
      follow = follow_fixture()
      assert %Ecto.Changeset{} = Posts.change_follow(follow)
    end
  end

  describe "tweets" do
    alias Samacare.Posts.Tweet

    @valid_attrs %{message: "some message", private: true, tweeted_at: "2010-04-17T14:00:00.000000Z"}
    @update_attrs %{message: "some updated message", private: false, tweeted_at: "2011-05-18T15:01:01.000000Z"}
    @invalid_attrs %{message: nil, private: nil, tweeted_at: nil}

    def tweet_fixture(attrs \\ %{}) do
      {:ok, tweet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Posts.create_tweet()

      tweet
    end

    test "list_tweets/0 returns all tweets" do
      tweet = tweet_fixture()
      assert Posts.list_tweets() == [tweet]
    end

    test "get_tweet!/1 returns the tweet with given id" do
      tweet = tweet_fixture()
      assert Posts.get_tweet!(tweet.id) == tweet
    end

    test "create_tweet/1 with valid data creates a tweet" do
      assert {:ok, %Tweet{} = tweet} = Posts.create_tweet(@valid_attrs)
      assert tweet.message == "some message"
      assert tweet.private == true
      assert tweet.tweeted_at == DateTime.from_naive!(~N[2010-04-17T14:00:00.000000Z], "Etc/UTC")
    end

    test "create_tweet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_tweet(@invalid_attrs)
    end

    test "update_tweet/2 with valid data updates the tweet" do
      tweet = tweet_fixture()
      assert {:ok, %Tweet{} = tweet} = Posts.update_tweet(tweet, @update_attrs)
      assert tweet.message == "some updated message"
      assert tweet.private == false
      assert tweet.tweeted_at == DateTime.from_naive!(~N[2011-05-18T15:01:01.000000Z], "Etc/UTC")
    end

    test "update_tweet/2 with invalid data returns error changeset" do
      tweet = tweet_fixture()
      assert {:error, %Ecto.Changeset{}} = Posts.update_tweet(tweet, @invalid_attrs)
      assert tweet == Posts.get_tweet!(tweet.id)
    end

    test "delete_tweet/1 deletes the tweet" do
      tweet = tweet_fixture()
      assert {:ok, %Tweet{}} = Posts.delete_tweet(tweet)
      assert_raise Ecto.NoResultsError, fn -> Posts.get_tweet!(tweet.id) end
    end

    test "change_tweet/1 returns a tweet changeset" do
      tweet = tweet_fixture()
      assert %Ecto.Changeset{} = Posts.change_tweet(tweet)
    end
  end
end
