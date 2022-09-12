defmodule Myfreela do
  alias Myfreela.{Job, User, Profile}

  #Users actions
  defdelegate create_user(params), to: User.Create, as: :call
  defdelegate fetch_user(params), to: User.Get, as: :call

  #Profile actions
  defdelegate fetch_profile(params), to: Profile.Get, as: :call
  defdelegate update_profile(params), to: Profile.Update, as: :call

  #Job actions
  defdelegate create_job(params), to: Job.Create, as: :call
  defdelegate delete_job(params), to: Job.Delete, as: :call
  defdelegate fetch_job(params), to: Job.Get, as: :call
  defdelegate update_job(params), to: Job.Update, as: :call

end
