defmodule KittBot do
  use Application
  require IEx

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    slack_token = Application.get_env(:kitt_bot, KittBot.Slack)[:token]
    IEx.pry

    children = [
      # worker(KittBot.Slack, [slack_token, :whatever]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: KittBot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
