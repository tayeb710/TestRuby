class ServiceJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
  end

  def calculLaunched(user_id)
    @users =User.where(user_id: user_id).count
  end

  def most_active_day_last_7_days(user_id)
    users =User.where("user_id = ? AND timestamp > ?", user_id, Date.today.prev_day(8))
    counts = []
    apps = []
    users.each do |name|
        count = users.where(timestamp: name.timestamp).count
        counts.push(count)
        apps.push(name.timestamp)
    end
    nbr = counts.find_index(counts.max)
    return (apps[nbr])
  end

  def number_of_days_active_last_7_days(user_id)
    users =User.where("user_id = ? AND timestamp > ?", user_id, Date.today.prev_day(8))
    arr = []
    users.each do |name|
      arr.push(name.timestamp)
    end
    x = arr.uniq
    return (x.count)
  end

  def most_launched_app_last_7_days(user_id)
    users =User.where("user_id = ? AND timestamp > ?", user_id, Date.today.prev_day(8))
    counts = []
    apps = []
    users.each do |name|
      count = users.where(app: name.app).count
      counts.push(count)
      apps.push(name.app)
    end
    nbr = counts.find_index(counts.max)
    return (apps[nbr])
  end

  def createUserStats(user_id)
    userStat UserStats.new
    userStat.user_id = user_id
    userStat.app_launched = calculLaunched(user_id)
    userStat.save
  end

  def calculDate(user_id)
    user =User.find_by(user_id: user_id)
    a_date = Time.now
    b_date = Time.parse(user.timestamp.to_s)
    puts((a_date - b_date).to_i/ (24 * 60 * 60))
    return((a_date - b_date).to_i/ (24 * 60 * 60))
  end
end
