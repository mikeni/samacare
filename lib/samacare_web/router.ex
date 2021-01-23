defmodule SamacareWeb.Router do
  use SamacareWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SamacareWeb do
    pipe_through :browser

    get "/", PageController, :index

  end

  # Other scopes may use custom stacks.
  scope "/api", SamacareWeb do
    pipe_through :api

    resources "/test_reds", TestRedController, except: [:new, :edit]
    resources "/test_greens", TestGreenController, except: [:new, :edit]
    resources "/users", UserController, except: [:new, :edit]
    resources "/follows", FollowController, except: [:new, :edit]
    resources "/tweets", TweetController, except: [:new, :edit]

  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: SamacareWeb.Telemetry
    end
  end
end
